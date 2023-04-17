//FONT AWSOME
import { config, library, dom } from '@fortawesome/fontawesome-svg-core'
config.mutateApproach = 'sync'
import { faHeartPulse } from '@fortawesome/free-solid-svg-icons'
import { faPencil } from '@fortawesome/free-solid-svg-icons'
import { faLocationDot } from '@fortawesome/free-solid-svg-icons'
import { faRightToBracket } from '@fortawesome/free-solid-svg-icons'
import { faCrown } from '@fortawesome/free-solid-svg-icons'
import { faBars } from '@fortawesome/free-solid-svg-icons'

library.add(faHeartPulse)
library.add(faPencil)
library.add(faLocationDot)
library.add(faRightToBracket)
library.add(faCrown)
library.add(faBars)
dom.watch()