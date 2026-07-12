#' Create new AB file
#'
#' @param name A character Vector with the name to use for file creation
#' @param semester A numeric indicating the semester you are working in
#' @param AB A numeric indicating which AB you want to work on
#' @param Level A numeric which level of AB you want to work on
#' @param where character: either "zuHause" or "vorOrt"
#' @param path optional, if your name is not associated with a path internally you can provide your own
#'
#' @returns Nothing. If necessary folders and a file  will be crated.
#' @export
#'
#' @examples
#' machNeu("Tobi", 2, 6, 1)
machNeu <- function(name, semester , AB, Level, where = "zuHause", path){
  if(name == "Tobi"){
    path <- "/home/tobiasds/Dokumente/Psychologie Bachelor/"
    name <- "schipp"
  } else if(name == "Finja"){
    path <- "C://Users/fengs/Downloads/studium/"
    name <- "mueller"
  }
  if(!requireNamespace("fs")){utils::install.packages("fs")}
  path2 <- paste0(path, semester, ". Semester/")
  path2 <- paste0(path2, "Statistik und Datenanalyse ", paste0(rep("I", semester), collapse = ""), "/")
  path2 <- paste0(path2, "Übung/")
  path = path2
  path2 = paste0(path, "Daten/")
  fs::dir_create(path2)
  if(semester == 3) {
    fName = paste0(name, "arbeitsbatt", AB,".R")
  } else{
    fName = paste0(name,"_arbeitsblatt", AB, "_Level", Level, "_", where, ".R")
  }
  fs::file_create(paste0(path,fName))
  writeLines(
    text = paste0("setwd(\"",path2,"\")"),
    con = paste0(path,fName)
  )
}
