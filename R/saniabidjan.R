#' saniabidjan:  Data About Behavior and Practices of Managing Sanitation Facilties in Abidjan, Cote d’Ivoire
#'
#' Household survey data collected from Yopougon and Abobo in Abidjan, Cote d'Ivoire.
#' The survey is about practices related to the management of sanitation facilities, specifically, latrines and tanks.
#'
#' @format A tibble with 207 rows and 25 variables
#' \describe{
#'   \item{area_name}{Identify survey areas, options including (1) Abobo and (2) Yopougon.}
#'   \item{sex}{Indicates respondents gender, options including (1) female and (2) male.}
#'   \item{education}{ Level of education of respondents, options including (1) no: the respondent did not go to school, (2) primary: the respondent has an elementary level, (3) coranic: the respondent went to a Quranic school, (4) high school: the respondent has a high school degree, and (5) graduate: the respondent has a university degree.}
#'   \item{housing_type}{Description of the accommodation unit where the respondent lives, options including (1) common courtyard and (2) individual.}
#'   \item{status}{Indicates if respondent is the homeowner or not, options including (1) free host: the respondent is hosted for free, (2) owner: the respondent is the homeowner, and (3) renter: the respondent is the renter.}
#'   \item{lat_facilities}{ Does the surveyed household have latrine facilities?}
#'   \item{facilities_loc}{Specifies the exact location of the latrine in the household, options including (1) house, (2) yard, and (3) out of yard.}
#'   \item{facilities_type}{Describes the type of latrine used in the household, options including (1) pit latrine, (2) improved latrine, and (3) public latrine.}
#'   \item{lat_sharing}{Explains how latrines are used in the household}
#'   \item{nb_user}{Reveals the number of users of the latrines.}
#'   \item{impacts_of_sharing}{Indication of how the respondent perceives the use of latrines, options including (1) hygiene problems, (2) no problems, (3) vulnerable to disease, and (4) waiting line.}
#'   \item{lat_care}{Gives an overview of the people in charge of latrine cleaning, options including (1) myself, (2) no care, and (3) private person, and (4) round turn.}
#'   \item{clean_freq_wk}{Specifies the cleaning frequency of latrines in the household.}
#'   \item{tank_presence}{Does the surveyed household have septic tank?}
#'   \item{tank_location}{Specifies the exact location of the septic tank in the household, options including (1) court yard, (2) out of court yard, and (3) not know.}
#'   \item{latrines_nb}{Reveals the number of latrines connecting to the septic tank.}
#'   \item{tk_status}{Expresses septic tank performance status.}
#'   \item{empty_freq_yr}{Indicates the number of times that the septic tank is emptied during the year in the household, options including (1) 1, (2) 2 and (3) 3.}
#'   \item{empty_mode}{Indicates how the septic tank is emptied in the household, options including (1) emptying truck, (2) manual emptying, and (3) truck and manual.}
#'   \item{empty_price}{Shows the charge/price (in CFA franc) for emptying the septic tank.}
#'   \item{wastwat_dispos}{Show whether the household has wastewater disposal facilities, options including (1) courtyard, (2) open drain, and (3) street.}
#'   \item{waste_cont}{ Does the surveyed household have solid waste disposal facilities?}
#'   \item{waste_cont_loc}{Precise location of solid waste disposal equipment, options including (1) courtyard and (2) out of courtyard.}
#'   \item{cont_empty_wk}{Indicates the emptying frequency of solid waste disposal equipment per week}
#'   \item{common_ill}{Overview of the most common disease in the household associated with sanitation, options including (1) diarrhea, (2) infections, (3) malaria, and (4) typhoid fever.}
#' }
"saniabidjan"
