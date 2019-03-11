from argparse import ArgumentParser
import requests

parser = ArgumentParser(description="Run a SQL command to create a table")
parser.add_argument('sql_file', type=str, help='Path to the .sql file')

args = parser.parse_args()

with open(args.sql_file) as fp:
    query = fp.read()

result = requests.post(
    "http://localhost:8123",
    params={"query": query},
)
result.raise_for_status()