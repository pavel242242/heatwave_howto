#!/bin/bash

# Define MySQL connection parameters
# MYSQL_HOST="localhost"
# MYSQL_PORT="3306"
# MYSQL_USER="your_username"
# MYSQL_PASSWORD=""
MYSQL_DATABASE="keboola2"

# Path to the directory containing the TPC-H queries
QUERY_DIR="queries/heatwave-tpch/TPCH"

# Output file to store the elapsed times
OUTPUT_FILE="query_times_${MYSQL_DATABASE}.txt"
echo "$OUTPUT_FILE"
# Function to run a query and measure its elapsed time
run_query() {
    local query_file=$1
    local query_name=$(basename "$query_file")

    echo "Running $query_name..."

    start_time=$(date +%s.%N)
    mysqlsh keboola@10.0.1.69 --sql -D "$MYSQL_DATABASE" --file="$query_file"
    #mysqlsh --sql -h "$MYSQL_HOST" -P "$MYSQL_PORT" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -D "$MYSQL_DATABASE" --file="$query_file"

    end_time=$(date +%s.%N)
    elapsed_time=$(echo "$end_time - $start_time" | bc)

    echo "$query_name: $elapsed_time seconds" | tee -a "$OUTPUT_FILE"
}

# Clear the output file
>"$OUTPUT_FILE"

# Run all the queries in the directory
for query_file in "$QUERY_DIR"/*.sql; do
    run_query "$query_file"
done

echo "All queries have been executed. Check $OUTPUT_FILE for elapsed times."
