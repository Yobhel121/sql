select
    店铺公司名称,
    战略分级,
    SPU,
    biz_day 日期,
    case when 店铺='新媒体-抖音官方旗舰店' then
        case when 短视频识别业务分类 in('图图炫饭','自营短视频-官旗鲁班','一棵杭白菜','兜兜成长记','悠悠妈') then concat(店铺,'(自营短视频)')
            when 短视频识别业务分类 in('短视频') then concat(店铺,'(达人短视频)')
            when 短视频识别业务分类 in('橱窗','米粉直播间','辅食油直播间','零食直播间','鳕鱼直播间','鳕鱼直播间') then concat(店铺,'(其它)')
        else concat(店铺,'(其它)') end
    else 店铺 end 店铺,
    sum(分摊后金额) GSV,
    sum(数量) 数量,
    sum(商品成本)  商品成本,
    sum(nvl(重量履约分摊,0)) 履约成本,
    sum(总赠品费用)  赠品费用
from tmp.fulfillment_07
# where 店铺 like '%天猫-秋田满满旗舰店%'
group by 店铺公司名称,
         战略分级,
         SPU,
         biz_day,
        case when 店铺='新媒体-抖音官方旗舰店' then
            case when 短视频识别业务分类 in('图图炫饭','自营短视频-官旗鲁班','一棵杭白菜','兜兜成长记','悠悠妈') then concat(店铺,'(自营短视频)')
                when 短视频识别业务分类 in('短视频') then concat(店铺,'(达人短视频)')
                when 短视频识别业务分类 in('橱窗','米粉直播间','辅食油直播间','零食直播间','鳕鱼直播间','鳕鱼直播间') then concat(店铺,'(其它)')
            else concat(店铺,'(其它)') end
        else 店铺 end ;


with tmp as (
    select
        店铺,biz_day,sum(总赠品费用) 总赠品费用,sum(赠品费用)  赠品费用
    from  tmp.fulfillment_07
#     where 店铺 = '天猫-秋田满满母婴品牌店'
    group by 店铺,biz_day
)
select * from tmp where abs(总赠品费用-赠品费用) >0.1
;




select
    店铺公司名称,
    战略分级,
    SPU,
    biz_day 日期,
    case when 店铺='新媒体-抖音官方旗舰店' then
        case when 短视频识别业务分类 in('图图炫饭','自营短视频-官旗鲁班','一棵杭白菜','兜兜成长记','悠悠妈') then concat(店铺,'(自营短视频)')
            when 短视频识别业务分类 in('短视频') then concat(店铺,'(达人短视频)')
            when 短视频识别业务分类 in('橱窗','米粉直播间','辅食油直播间','零食直播间','鳕鱼直播间','鳕鱼直播间') then concat(店铺,'(其它)')
        else concat(店铺,'(其它)') end
    else 店铺 end 店铺,
    sum(分摊后金额) GSV,
    sum(数量) 数量,
    sum(商品成本)  商品成本,
    sum(nvl(重量履约分摊,0)) 履约成本,
    sum(总赠品费用)  赠品费用
from tmp.fulfillment_07
# where 货品名称 not like '%便携装%' and 分摊后金额 <= 0
group by 店铺公司名称,
         战略分级,
         SPU,
         biz_day,
        case when 店铺='新媒体-抖音官方旗舰店' then
            case when 短视频识别业务分类 in('图图炫饭','自营短视频-官旗鲁班','一棵杭白菜','兜兜成长记','悠悠妈') then concat(店铺,'(自营短视频)')
                when 短视频识别业务分类 in('短视频') then concat(店铺,'(达人短视频)')
                when 短视频识别业务分类 in('橱窗','米粉直播间','辅食油直播间','零食直播间','鳕鱼直播间','鳕鱼直播间') then concat(店铺,'(其它)')
            else concat(店铺,'(其它)') end
        else 店铺 end ;

select * from tmp.fulfillment_07 where 货品名称 like '%便携装%' and 分摊后金额 > 0 ;

select distinct 短视频识别业务分类 from fulfillment_07;

select
    *
from  tmp.fulfillment_07
where 店铺 = '天猫-秋田满满母婴品牌店' and biz_day = '2025-07-01';

select trade_type,* from ods.jky_qm_trades_fullinfo where trade_no = 'JY2025072344206';

-- 自营短视频
图图炫饭
自营短视频-官旗鲁班
一棵杭白菜
兜兜成长记
悠悠妈

-- 达人短视频
短视频

-- 其它
橱窗
米粉直播间
辅食油直播间
零食直播间
鳕鱼直播间
胚芽米自播


select * from tmp.fulfillment_0723

