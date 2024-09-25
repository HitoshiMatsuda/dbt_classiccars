Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## 概要
gitへpull request

## 新規schemaの自動作成
models/staging/classiccars/classiccars_offices.sql
```
with source as (
    -- 新規schemaをソーステーブルが存在するDBへ新規作成したい場合は'{{ config(schema='marketing') }}'を記載する
    -- schema='xxx'で元schema名 + _xxxという新規schemaが作成される
    select * from {{ source('classiccars', 'OFFICES') }}
),
```