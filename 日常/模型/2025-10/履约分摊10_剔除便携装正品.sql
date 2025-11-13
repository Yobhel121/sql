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
from tmp.fulfillment_10
# where 店铺 like '%折扣店%'
group by 店铺公司名称,
         战略分级,
         SPU,
         biz_day,
        case when 店铺='新媒体-抖音官方旗舰店' then
            case when 短视频识别业务分类 in('图图炫饭','自营短视频-官旗鲁班','一棵杭白菜','兜兜成长记','悠悠妈') then concat(店铺,'(自营短视频)')
                when 短视频识别业务分类 in('短视频') then concat(店铺,'(达人短视频)')
                when 短视频识别业务分类 in('橱窗','米粉直播间','辅食油直播间','零食直播间','鳕鱼直播间','鳕鱼直播间') then concat(店铺,'(其它)')
            else concat(店铺,'(其它)') end
        else 店铺 end;



select * from tmp.fulfillment_10 where 店铺 = '天猫-秋田满满旗舰店' and 商品成本 is null;


