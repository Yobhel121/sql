select * from ads.financial_ledger_report_metrics


select trans_date,count(1) from ods.rpa_tm_promotion_fee
                        where trans_date like '2025-08%'
group by trans_date

