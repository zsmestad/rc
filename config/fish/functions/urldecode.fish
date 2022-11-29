function urldecode
  echo -n "$argv[1]" | python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"
end
