import { config, library, dom } from '@fortawesome/fontawesome-svg-core'
import {faStar} from '@fortawesome/free-regular-svg-icons'
import {faStar as faStarsolid} from '@fortawesome/free-solid-svg-icons'

  config.mutateApproach = 'sync'
  library.add(faStar,faStarsolid)
  dom.watch()