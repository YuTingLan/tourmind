import { application } from "./application"

import FlashController from "./flash_controller"
application.register("flash", FlashController)
import HotelController from "./hotel_controller"
import NavbarController from "./navbar_controller"
application.register("hotel", HotelController)
application.register("navbar", NavbarController)
