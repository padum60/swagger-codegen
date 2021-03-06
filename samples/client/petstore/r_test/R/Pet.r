# Swagger Petstore
# 
# This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
# 
# OpenAPI spec version: 1.0.0
# Contact: apiteam@swagger.io
# Generated by: https://github.com/swagger-api/swagger-codegen.git



#' Pet Class
#' @export
Pet <- R6::R6Class(
  'Pet',
  public = list(
    `id` = NULL,
    `category` = NULL,
    `name` = NULL,
    `photoUrls` = NULL,
    `tags` = NULL,
    `status` = NULL,
    initialize = function(`id`, `category`, `name`, `photoUrls`, `tags`, `status`){
      if (!missing(`id`)) {
        stopifnot(is.numeric(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
      if (!missing(`category`)) {
        stopifnot(is.list(tags), length(tags) != 0)
        lapply(`category`, function(x) stopifnot("Element" %in% class(x), !is.list(x)))
        self$`category` <- `category`
      }
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`photoUrls`)) {
        stopifnot(is.list(`photoUrls`), length(`photoUrls`) != 0)
        lapply(`photoUrls`, function(x) stopifnot(is.character(x)))
        self$`photoUrls` <- `photoUrls`
      }
      if (!missing(`tags`)) {
        stopifnot(is.list(tags), length(tags) != 0)
        lapply(`tags`, function(x) stopifnot("Element" %in% class(x), !is.list(x)))
        self$`tags` <- `tags`
      }
      if (!missing(`status`)) {
        stopifnot(is.character(`status`), length(`status`) == 1)
        self$`status` <- `status`
      }
    },
    toJSON = function() {
       sprintf(
        '{
           "id": %d,
           "category": %s,
           "name": "%s",
           "photoUrls": ["%s"],
           "tags": [%s],
           "status": "%s"
        }',
        self$`id`,
        self$`category`$toJSON(),
        self$`name`,
        lapply(self$`photoUrls`, function(x) paste(paste0('"', x, '"'), sep=",")),
        lapply(self$`tags`, function(x) paste(x$toJSON(), sep=",")),
        self$`status`
      )
    },
    fromJSON = function(PetJson) {
      PetObject <- jsonlite::fromJSON(PetJson)
      self$`id` <- PetObject`$id`
      self$`category` <- Category$new()$fromJSON(jsonlite::toJSON(PetObject${{baseName}))
      self$`name` <- PetObject`$name`
      self$`photoUrls` <- PetObject`$photoUrls`
      self$`tags` <- lapply(PetObject$`tags`, function(x) Tag$new()$fromJSON(jsonlite::toJSON(x))
      self$`status` <- PetObject`$status`
    }
  )
)

#' Element Class
#'
#' Element Class
#' @export
Element  <- R6::R6Class(
  'Element',
  public = list(
    id = NULL,
    name = NULL,
    initialize = function(id,name){
      if (!missing(id)) {
        stopifnot(is.numeric(id), length(id) == 1)
        self$id <- id
      }
      if (!missing(name)) {
        stopifnot(is.character(name), length(name) == 1)
        self$name <- name
      }
    },
    toJSON = function() {
       sprintf('{"id":%d,"name":"%s"}', self$id, self$name)
    }
  )
)

#' Response Class
#'
#' Response Class
#' @export
Response  <- R6::R6Class(
  'Response',
  public = list(
    content = NULL,
    response = NULL,
    initialize = function(content, response){
      self$content <- content
      self$response <- response
    }
  )
)
