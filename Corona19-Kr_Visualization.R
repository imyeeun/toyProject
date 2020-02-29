library("tidyverse")    # dplyr
library("readxl")   # fread

corona19 <- readxl::read_excel(path = "corona19-kr.xlsx",
                   col_names = TRUE)

corona19
# 함수로 인식하길래. 
corona19<- rename(corona19, "kst"="datetime(kst)")

summary(corona19)

#지역별 확진자 비교
corona19%>%
  filter(state1=='확진')%>%
  ggplot(aes(x=kst, y=count, group = location, color = location)) +
  geom_line()+
  facet_wrap(~ location)+
  theme_bw() +
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank())
  

# 지역별 검사현황 및 확진자 비교.
corona19%>%
  ggplot(aes(x=kst, y=count, group = state1, color = state1)) +
  geom_line()+
  facet_wrap(~ location)+
  theme_bw() +
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank())
  


