import { preferences } from '@kit.ArkData'
import { Context } from '@kit.AbilityKit'
import { AdvertModel } from '../models/advert'
import { JSON } from '@kit.ArkTS'
import { PREFERENCES_NAME, XSD_OPEN_SCREEN_AD } from '../constants'


// 广告的默认配置
export const defaultAd: AdvertModel = {
  adTime: 2,
  showAd: true,
  adUrl: $r('app.media.ad')
}

export class UserPreferences {
  context: Context

  constructor(context: Context) {
    this.context = context
  }


  // 首选项存储 ---》 必须要有仓库
  get shared(): preferences.Preferences {
    return preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME })
  }


  // 存储广告数据
  setUserAd(ad: AdvertModel) {
    const store = this.shared;
    // 给仓库中存储数据
    store.putSync(XSD_OPEN_SCREEN_AD, JSON.stringify(ad))
    store.flush()
  }

  // 获取数据
  get userAd(): AdvertModel {
    const store = this.shared;
    let m = JSON.parse(store.getSync(XSD_OPEN_SCREEN_AD, JSON.stringify(defaultAd)) as string)
    return m as AdvertModel
  }
}