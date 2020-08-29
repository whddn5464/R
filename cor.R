head(mtcars)
car_cor <-cor(mtcars)
round(car_cor,2)
head(mtcars)

install.packages("corrplot")
library(corrplot)

# corrplot(car_cor)

# corrplot(car_cor, method = "number")

col <- colorRampPalette(c("yellow2","goldenrod","darkred"))

corrplot(car_cor,
         method = "color",       # 색깔로 표현
         col = col(200),         # 색상 200개 선정
         type = "lower",         # 왼쪽 아래 행렬만 표시
         order = "hclust",       # 유사한 상관계수끼리 군집화
         addCoef.col = "black",  # 상관계수 색깔
         tl.col = "black",       # 변수명 색깔
         tl.srt = 45,            # 변수명 45도 기울임
         diag = F)               # 대각 행렬 제외
