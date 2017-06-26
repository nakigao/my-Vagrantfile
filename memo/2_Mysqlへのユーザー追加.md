2_Mysqlへのユーザー追加
===

DBサーバーのダンプとかテキストファイルで開くの無理・・・

```
mysql -u root

# 追加
grant all privileges on databasename.* to username@"192.168.100.1" identified by 'username' with grant option;

# 削除
revoke all on databasename.* from  username@'192.168.100.1';
```