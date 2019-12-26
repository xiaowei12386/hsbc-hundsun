--基金工作日检查 
--2020年所有节假日，共27个，这27个节假日中周末有9个，周末共104个，因此基金系统工作日一共366-（104+27-9）=244
/*   
     1月份：20200101,20200124,20200125,20200126,20200127,20200128,20200129,20200130
     4月份：20200404,20200405,20200406
     5月份：20200501,20200502,20200503,20200504,20200505,
     6月份：20200625,20200626,20200627
     10月份：20201001,20201002,20201003,20201004,20201005,20201006,20201007,20201008
    调休日：20200119，20200201，20200426，20200509,20200628,20200927,20201010
    香港节假日:20200410,20200411,20200413,20200430,20200701,20201026,20201225,20201226
     */

--系统工作日个数  结合实际跑批情况，若全年都跑批则366条，按照国家法定工作日跑批则251条
--若此条查询结果366，则全年跑批。
--若此条查询结果251，按国家法定工作日跑批（包含调休日20200119，20200201，20200426，20200509,20200628,20200927,20201010）。
select count(1) from tbtransday where trans_date>=20200101 and trans_date<=20201231 and date_type='0';

--2020年节假日是122个，如果没通过节日假日设置，则可忽略这条sql
--如果有设置节假日，可执行下面的sql，返回记录不是122，跟业务反馈，2020年系统节假日设置的不对。
select count(1) from tbtransday where trans_date>=20200101 and trans_date<=20201231 and date_type='8';

--查基金产品工作日设置在节假日内或者周末的 若此条有数据需删除，或者管理台去除工作日

select p.prd_code, p.prd_name, a.trans_date
  from tbproduct p,
       (select *
          from tbtransday
         where trans_date >= 20200101
           and trans_date <= 20201231
           and date_type = '2'
         and (trans_date 
   in (20200101,20200124,20200125,20200126,20200127,20200128,20200129,20200130,
       20200404,20200405,20200406, 
       20200501,20200502,20200503,20200504,20200505,
       20200625,20200626,20200627,    
       20201001,20201002,20201003,20201004,20201005,20201006,20201007,20201008)
    or
       to_char(to_date(trans_date, 'YYMMDD'), 'd') in ('7', '1'))) a
 where p.prd_type in ('0','8','B')
       and p.prd_code = a.asso_code;



--查基金TA工作日设置在节假日内或者周末的 若此条有数据需删除

select p.ta_code, p.ta_name, a.trans_date
  from tbtainfo p,
       (select *
          from tbtransday
         where trans_date >= 20200101
           and trans_date <= 20201231
           and date_type = '1'
        and (trans_date 
   in (20200101,20200124,20200125,20200126,20200127,20200128,20200129,20200130,
       20200404,20200405,20200406, 
       20200501,20200502,20200503,20200504,20200505,
       20200625,20200626,20200627,    
       20201001,20201002,20201003,20201004,20201005,20201006,20201007,20201008)
    or
       to_char(to_date(trans_date, 'YYMMDD'), 'd') in ('7', '1'))) a
 where p.status != '3'
   and p.prd_type in ('0','8','B')
   and p.ta_code = a.asso_code;



--查询各产品的工作日设置个数,查询设置个数,主要查询没有设置工作日的产品（num为0）、以及工作日设置较少而产品到期日期久远等情况
--如下sql查出 num若大于244个则可能设置有多设置，小于244可能有正常工作日未设置
select a.prd_code,
       a.prd_name,
       a.reserve1,
       a.ipo_start_date,
       a.end_date,
       nvl(b.num, 0)
  from tbproduct a
  left join (select asso_code, count(trans_date) num
               from tbtransday
              where trans_date >= 20200101
                and trans_date <= 20201231
                and date_type = '2'
              group by asso_code) b
    on a.prd_code = b.asso_code
 where a.status not in ('3', 'a')
   and a.prd_type in ('0','8','B')
   and nvl(b.num, 0) != 244
 order by b.num asc;

--查询各TA的工作日设置个数,查询设置个数,主要查询没有设置工作日的产品（num为0）、以及工作日设置较少而产品到期日期久远等情况
--如下sql查出 num若大于244个则可能设置有多设置，小于244可能有正常工作日未设置
select a.ta_code,
			 a.ta_name,
       nvl(b.num, 0)
  from tbtainfo a
  left join (select asso_code, count(trans_date) num
               from tbtransday
              where trans_date >= 20200101
                and trans_date <= 20201231
                and date_type = '1'
              group by asso_code) b
    on a.ta_code = b.asso_code
 where a.status not in ('3', 'a')
   and a.prd_type in ('0','8','B')
   and nvl(b.num, 0) != 244
 order by b.num asc;


