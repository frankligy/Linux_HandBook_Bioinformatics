# Find command

```bash
find . -mindepth 1 -maxdepth 1 -type f ! -name "*.raw" -exec rm {} \;
find . -type d -exec rm -r {} \;
```

For some reason, I feel the double quotation is recommended, especially with variable enclosed, the `\;` in the end means you need `;` to end the `exec`, and you also need 
`\` to escape the `;`.




