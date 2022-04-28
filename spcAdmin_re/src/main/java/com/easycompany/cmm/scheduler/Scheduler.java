package com.easycompany.cmm.scheduler;

import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
public class Scheduler {
    Logger log = Logger.getLogger(this.getClass());
 
   ;
    
    /*매월 1일 0시 30분 명예의전당 입력*/
    @SuppressWarnings("unused")
	@Scheduled(cron="*/10 * * * * *")
    public void livirioScheduler() {
        try{
            Date today = Calendar.getInstance().getTime();
           /*
            System.out.println("================================================================");
            System.out.println("==================Scheduler=====================================");
            System.out.println("=====" + "Today : " + today + "\n");
            System.out.println("================================================================");
          */
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    

    @Scheduled(cron="*/10 * * * * *")
    public void dbScheduler() {
        try{
            Date today = Calendar.getInstance().getTime();

            /*
            searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    		searchVO.setPageSize(propertiesService.getInt("pageSize"));
    		searchVO.setSearchCondition("0");
    		searchVO.setSearchKeyword("");
    		
            int totCnt = sampleService.selectSampleListTotCnt(searchVO);
           
            System.out.println("================================================================");
            System.out.println("=====" +"TotCnt : " + totCnt  + " /  Today : " + today + "");
            System.out.println("================================================================");
            */
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    
    
    
}
