-- 拆元素
with t1 as(
  select 101 as user_id,'[{"type":"a","content":"abc"}]' as content,'{"a":1}' as level union all
  select 102 as user_id,'[{"type":"a","content":"ad"},{"type":"b","content":"ab"}]','{"a":1,"b":2}'
)
,t1_json as(
    select user_id
        ,level
        ,json_parse(content)                    as content_json
        ,regexp_count(content,'}\\s*,\\s*{')    as cnt
        ,json_parse(level)                      as level_json
        -- ,REGEXP_COUNT(level,':')                as level_cnt
    from t1
)
,temp as(
    select t1.user_id
        ,cast(json_extract(t1.content_json, concat('$[',index_tbl.index_no,'].type')) as string)       as "type1"
        ,cast(json_extract(t1.content_json, concat('$[',index_tbl.index_no,'].content')) as string)    as "content"
        ,cast(map_keys(str_to_map(regexp_extract(replace(t1.level,'"',''),'{(.*?)}'),',',':'))[index_tbl.index_no] as string)    as "type2"
        ,cast(map_values(str_to_map(regexp_extract(replace(t1.level,'"',''),'{(.*?)}'),',',':'))[index_tbl.index_no] as int)     as "level"
    from t1_json t1
    -- 使用 sequence() 动态发散
    lateral view explode(sequence(0, t1.cnt)) index_tbl as index_no
)
select t2.user_id,t2.type1 as "type",t2.content,t3.level
from temp t2, temp t3
where t2.user_id=t3.user_id and t2.type1=t3.type2;



select __dm_emitted_at,* from jky.qm_trades_fullinfo where tradeNo = 'JY2025102016440'