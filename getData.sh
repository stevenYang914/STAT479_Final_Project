wget --load-cookies /tmp/cookies.txt  \
    "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ZYstHM4pd5gEIqo0-DM8CmA27uG61wcu' -O- \ 
    | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1ZYstHM4pd5gEIqo0-DM8CmA27uG61wcu" -O data.csv && rm -rf /tmp/cookies.txt
