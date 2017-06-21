select 'DQ_NN_AMC_CUST_ACCOUNT_1', 'AMC_CUST_ACCOUNT.ETL_FILEID, AMC_CUST_ACCOUNT.ETL_BATCHID, AMC_CUST_ACCOUNT.EAP_AS_OF_DT, AMC_CUST_ACCOUNT.IMSNUMBER' pknames, A.ETL_FILEID pk1, A.ETL_BATCHID pk2, A.EAP_AS_OF_DT pk3, A.IMSNUMBER pk4, '-' pk5,'-' pk6, '-' pk7, '-' pk8, A.FIRMCODE errcol,         case (A.FIRMCODE is null or A.FIRMCODE = '') and 1=1 When True Then 1 Else 0 end NullChkResult, case (length(A.FIRMCODE) < 0 or length(A.FIRMCODE) > 2) and 1=1 When True Then 1 Else 0 end LenChkResult, case (A.FIRMCODE not in ('AAPX','AAVP','BKR','SBSH','CHAR','CMTA','CONF','CONS','CAVP','CRI','CXL','OPCT','DOC','DUMY','FACI','SUSP','FUSD','GVUP','GAVP','IAP','INST','INTB','INTA','SBAL','INTI','SHED','IBKR','LGP','MKTM','OPRP','PBSB','PBBK','PRIV','PROP','RHDG','REPO','COLL','PSYF','ZALL','HALL','SPLT','CUST','STEX','BUYN','RECL','SWPC','SWNG','SYN','TEMP','TEST')) When True Then 1 Else 0 end LovChkResult, -1 DataChkResult, case B.CNT=1 then 1 else 0 end RefChkResult  from AMC_CUST_ACCOUNT A LEFT OUTER JOIN (select 'AMC_CUST_ACCOUNT.ETL_FILEID, AMC_CUST_ACCOUNT.ETL_BATCHID, AMC_CUST_ACCOUNT.EAP_AS_OF_DT, AMC_CUST_ACCOUNT.IMSNUMBER' pknames,AMC_CUST_ACCOUNT.ETL_FILEID, AMC_CUST_ACCOUNT.ETL_BATCHID, AMC_CUST_ACCOUNT.EAP_AS_OF_DT, AMC_CUST_ACCOUNT.IMSNUMBER, '-','-', '-', '-', case when (( . IS NULL OR + .='' ) and (1=1)) then 1 else 0 end  ref_Case from AMC_CUST_ACCOUNT LEFT OUTER JOIN on ( AMC_CUST_ACCOUNT.FIRMCODE=.)
) C        on A.ETL_FILEID=C.ETL_FILEID and A.ETL_BATCHID=C.ETL_BATCHID and A.EAP_AS_OF_DT=C.EAP_AS_OF_DT and A.IMSNUMBER=C.IMSNUMBER and '-'='-' and '-'='-' and '-'='-' and '-'='-'         where (A.FIRMCODE is not null and A.FIRMCODE != '')
select 'DQ_NN_AMC_CUST_ACCOUNT_2', 'AMC_CUST_ACCOUNT.ETL_FILEID, AMC_CUST_ACCOUNT.ETL_BATCHID, AMC_CUST_ACCOUNT.EAP_AS_OF_DT, AMC_CUST_ACCOUNT.IMSNUMBER' pknames, A.ETL_FILEID pk1, A.ETL_BATCHID pk2, A.EAP_AS_OF_DT pk3, A.IMSNUMBER pk4, '-' pk5,'-' pk6, '-' pk7, '-' pk8, A.GFCID errcol,         -1 NullChkResult, case (length(A.GFCID) < 0 or length(A.GFCID) > 3) and 1=1 When True Then 1 Else 0 end LenChkResult, case (A.GFCID not in ('AR','BF','DA','DC','DI','DW','EB','FC','FE','FF','FI','FR','IB','IC','II','PA','PB','PC','PF','PG','PH','PL','PN','PQ','PR','PS','PT','PW','PY','PZ','RO','RP','SB','SF','SI','WS','XB')) When True Then 1 Else 0 end LovChkResult, case (Not (AMC_CUST_ACCOUNT.GFCID is null or AMC_CUST_ACCOUNT.GFCID = '') and (AMC_CUST_ACCOUNT.GFCID like )) When True Then 1 Else 0 end DataChkResult, case B.CNT=1 then 1 else 0 end DupChkResult, case C.ref_Case=1 then 1 else 0 end RefChkResult  from AMC_CUST_ACCOUNT A LEFT OUTER JOIN (select AMC_CUST_ACCOUNT.ETL_FILEID, AMC_CUST_ACCOUNT.ETL_BATCHID, AMC_CUST_ACCOUNT.EAP_AS_OF_DT, AMC_CUST_ACCOUNT.IMSNUMBER, '-','-', '-', '-', 1 CNT from AMC_CUST_ACCOUNT where 1=1 GROUP BY ETL_FILEID,ETL_BATCHID,EAP_AS_OF_DT,IMSNUMBER HAVING COUNT(1)>1) B LEFT OUTER JOIN (select 'AMC_CUST_ACCOUNT.ETL_FILEID, AMC_CUST_ACCOUNT.ETL_BATCHID, AMC_CUST_ACCOUNT.EAP_AS_OF_DT, AMC_CUST_ACCOUNT.IMSNUMBER' pknames,AMC_CUST_ACCOUNT.ETL_FILEID, AMC_CUST_ACCOUNT.ETL_BATCHID, AMC_CUST_ACCOUNT.EAP_AS_OF_DT, AMC_CUST_ACCOUNT.IMSNUMBER, '-','-', '-', '-', case when (( amc_all_accounts.IMSNumber IS NULL OR + amc_all_accounts.IMSNumber='' ) and (1=1)) then 1 else 0 end  ref_Case from AMC_CUST_ACCOUNT LEFT OUTER JOIN (select  IMSNUMBER from l1_amlmkt_amcg.amc_broker_account where eap_as_of_dt='2016-04-04' UNION ALL select  IMSNUMBER from l1_amlmkt_amcg.amc_cust_account  where  eap_as_of_dt='2016-04-04'  UNION ALL select IMSNUMBER from l1_amlmkt_amcg.amc_firm_account where eap_as_of_dt='2016-04-04')amc_all_accountson ( AMC_CUST_ACCOUNT.GFCID=amc_all_accounts.IMSNumber)
) C         on A.ETL_FILEID=B.ETL_FILEID and A.ETL_BATCHID=B.ETL_BATCHID and A.EAP_AS_OF_DT=B.EAP_AS_OF_DT and A.IMSNUMBER=B.IMSNUMBER and '-'='-' and '-'='-' and '-'='-' and '-'='-'         A.ETL_FILEID=C.ETL_FILEID and A.ETL_BATCHID=C.ETL_BATCHID and A.EAP_AS_OF_DT=C.EAP_AS_OF_DT and A.IMSNUMBER=C.IMSNUMBER and '-'='-' and '-'='-' and '-'='-' and '-'='-'         where (A.GFCID is not null and A.GFCID != '')
