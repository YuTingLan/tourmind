//FONT AWSOME
import { config, library, dom } from '@fortawesome/fontawesome-svg-core'
config.mutateApproach = 'sync'
import { faHeartPulse, faPencil, faLocationDot, faRightToBracket, faCrown, faBars } from '@fortawesome/free-solid-svg-icons'

library.add(faHeartPulse, faPencil, faLocationDot, faRightToBracket, faCrown, faBars)
dom.watch()