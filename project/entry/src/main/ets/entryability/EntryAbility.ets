import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemMediaQuery, window } from '@kit.ArkUI';
import { AdvertModel, defaultAd, UserPreferences } from 'basic';
import AppUtil from '../../util/AppUtil';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 进入应用的时候，调用后台接口获取广告配置
    const ad = await new Promise<AdvertModel>((resolve) => {
      setTimeout(() => {
        resolve(defaultAd)
      }, 500)
    })

    // 将广告的配置存储到本地
    const pref = new UserPreferences(this.context)
    pref.setUserAd(ad)

    if (ad.showAd) {
      // 创建子窗口
      const window = await windowStage.createSubWindow('ad_window')
      // 显示子窗口
      await window.showWindow()
      // 加载广告
      window.setUIContent('pages/start/StartPage')
    }

    windowStage.getMainWindow((err, mainWindow: window.Window) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to get main window. Cause: %{public}s', JSON.stringify(err));
      } else {
        // mainWindow.setWindowLayoutFullScreen(true)
        let avoidArea: window.AvoidArea = mainWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        let vpStatusBarHeight: number = px2vp(avoidArea.topRect.height)
        let vpNavigationBarHeight: number = px2vp(avoidArea.bottomRect.height)
        let safeArea: Margin = {
          top: vpStatusBarHeight,
          bottom: vpNavigationBarHeight,
        }
        AppUtil.saveSafeArea(safeArea)
      }
    })

    // 1. 获取 token
    const token = pref.getUserToken()
    let path = ''
    if (token) {
      path = 'pages/index/Index'
    } else {
      path = 'pages/login/LoginPage'
    }
    windowStage.loadContent(path, (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
      }
      hilog.info(0x0000, 'testTag', '%{public}s', 'Succeeded in loading the content.')
    })

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
