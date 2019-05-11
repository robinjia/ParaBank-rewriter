import json
import sys

def main():
  for line in sys.stdin:
    obj = json.loads(line)
    print(obj['text'])

if __name__ == '__main__':
  main()
