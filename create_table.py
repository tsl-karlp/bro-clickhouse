from argparse import ArgumentParser
import sys
import re
import requests

parser = ArgumentParser(description="Run a SQL command to create a table")
parser.add_argument('sql_file', type=str, help='Path to the .sql file')

args = parser.parse_args()

with open(args.sql_file) as fp:
    query = fp.read()

m = re.search(r"table (\S*)", query)
table_name = m.group(1)

tables = requests.post("http://localhost:8123", params={"query":"SHOW TABLES"}).text.split("\n")
if table_name in tables:
    print(f"Table `{table_name}` already exists, not continuing")
    sys.exit()

result = requests.post(
    "http://localhost:8123",
    params={"query": query},
)
try:
    result.raise_for_status()
except requests.exceptions.HTTPError as exc:
    raise Exception(result.text) from exc
