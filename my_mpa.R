library(maps)
library(ggplot2)
asia <- map_data("world", region = c("China","Japan","North Korea","South Korea", "India"))
ggplot(asia, aes(x=long, y=lat, group=group, fill=region)) + geom_polygon(colour="black") + scale_fill_brewer(palette="Set2")
korea <- map_data("world", region = c("North Korea", "South Korea"))
ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group, fill=region),colour="black") + scale_fill_brewer(palette="Set2")#남한 북한만 지도에 표시
data(world.cities)#세계 data set 불러오기
head(world.cities)
skorea.pop <- world.cities[world.cities$country.etc %in% "Korea South",]
skorea.pop <- skorea.pop[order(skorea.pop$pop),]
skorea.pop <- tail(skorea.pop,10)
skorea.pop <- skorea.pop[-10,]#우리나라 인구의 10번째까지 구하기
nkorea.pop <- world.cities[world.cities$country.etc %in% "Korea North",]
nkorea.pop <- nkorea.pop[order(nkorea.pop$pop),]
nkorea.pop <- tail(nkorea.pop,9)
library(scales)
korea.pop <- rbind(skorea.pop,nkorea.pop)#북한 인구의 10번째까지의 도시구하기 그후 합친다.
label_ko_num = function(num) {
  ko_num = function(x) {
    new_num = x %/% 10000
    return(paste(new_num, '만', sep = ''))
  }
  # vapply를 쓰고 싶지만 가끔 문자열대신 NA가 출력되는 경우도 있으니 
  # 여기서는 간단하게 sapply를 적용
  return(sapply(num, ko_num))
}
ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group, fill=region),colour="black") + scale_fill_brewer(palette="Set2")+ geom_point(data=korea.pop, aes(x=long, y=lat, size = pop), shape = 16, color = "yellow", alpha = 0.4)+ scale_size_continuous(labels = scales::comma)+ geom_text(data=korea.pop, aes(x=long+0.2, y=lat+0.2, label=name))