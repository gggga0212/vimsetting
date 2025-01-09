#!/bin/bash

# 定義輸出檔案名
output_file="Headers.txt"

# 如果輸出檔案已經存在，先刪除它
if [ -f "$output_file" ]; then
    rm "$output_file"
fi

# 遞迴搜尋所有 .h 檔案並合併它們的內容到輸出檔案中
find . -type f -name "*.h" | while read -r file; do
    cat "$file" >> "$output_file"
    echo -e "\n" >> "$output_file"  # 在每個檔案之間加一個空行
done

echo "所有 .h 檔案的內容已合併到 $output_file"

