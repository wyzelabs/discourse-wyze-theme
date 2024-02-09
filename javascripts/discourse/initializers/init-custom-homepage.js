import { apiInitializer } from 'discourse/lib/api'
import CustomHomepage from '../components/custom-homepage'

export default apiInitializer('1.14.0', api => {
  api.renderInOutlet('top-notices', CustomHomepage)
})
