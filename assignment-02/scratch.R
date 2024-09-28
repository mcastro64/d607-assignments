library(RMySQL)
library(digest) 
library(clipr) 

db_host <- 'cunydata607sql.mysql.database.azure.com' 
db_port <- 3306

db_user <- "marco.castro64"
# Generate password
hash_hex <- digest("23258964", algo = "sha256", serialize = FALSE) 

db_password <- substr(hash_hex, 1, nchar(hash_hex) %/% 4)

db_user <- 'marco.castro64'
db_name <- 'marcocastro64'
db_table <- 'survey_movie_ratings'

# Read data from db
mydb <-  dbConnect(MySQL(), user = db_user, password = db_password,
                   dbname = db_name, host = db_host, port = db_port)

query <- "SELECT r.response_id, p.FirstName, m.title, r.rating FROM survey_movie_ratings AS r LEFT JOIN survey_movies AS m ON m.movie_id = r.movie_id LEFT JOIN survey_participants AS p ON p.participant_id = r.participant_id"
rs <- dbSendQuery(mydb, query)
df <-  fetch(rs, n = -1)
dbDisconnect(mydb)

movie_ratings <- na.omit(df) |>
  mutate()

ggplot(data=movie_ratings, aes(x=title, y=rating), stat="summary", fun="mean") +
  geom_bar() +
 
  coord_flip() +
  labs(
    title = "Movie Ratings",
    subtitle = "n=6",
    x = "Movies",
    y = "Rating"
  )   
