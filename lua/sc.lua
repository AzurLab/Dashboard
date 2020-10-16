os.execute([[su -c 'sed -i -E s,^default_url=$,default_url=!!import:snippets/url.txt, /data/data/com.termux/files/home/subconverter/pref.ini']])
print("自动配置成功")
