find . \
  -path './.git' -prune -o \
  -type f \( -name '*.lua' -o -name 'lazy-lock.json' -o -name '.gitignore' \) \
  -print |
sort |
while read -r f; do
  echo "===== $f ====="
  cat "$f"
  echo
done > neovim_dump.txt
