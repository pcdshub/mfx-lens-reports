#!/bin/bash

REPORT_ID=$1

if [ -z "$REPORT_ID" ]; then
    echo "Usage: $0 [report_id]"
    exit 1
fi

mkdir -p data/$REPORT_ID/
mv pre_focus* data/$REPORT_ID/
mv summary.{pdf,png} data/$REPORT_ID/

git add data/$REPORT_ID
git add report_${REPORT_ID}.pdf

cat >> README.md <<EOF

${REPORT_ID}
==============

1. PLC code: 
2. IOC code: 
3. PCDS environment: 
4. Transfocate: 

Run on \`\`${hostname}\`\`.

\`\`\`
$ ipython -i -m transfocate.automated_checkout

...

((output here))
\`\`\`

![Summary](data/${REPORT_ID}/summary.png)
[Report](report_${REPORT_ID}.pdf)
EOF
