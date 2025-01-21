import { TabBarData, UserPreferences } from 'basic';
import AppUtil from '../../../util/AppUtil';
import Message from './message/Message';
import Mine from './mine/Mine';
import Task from './task/Task';


@Entry
@Component
struct Index {
  // tabBar的数据
  @State tabsData: TabBarData[] = [
    {
      name: 'task',
      title: '任务',
      icon: $r('app.media.ic_tab_btn_task')
    },
    {
      name: 'message',
      title: '消息',
      icon: $r('app.media.ic_tab_btn_mess_nor')
    },
    {
      name: 'my',
      title: '我的',
      icon: $r('app.media.ic_tab_btn_mine_nor')
    }
  ]
  // 初始化一个变量，保存选中的 tabBar
  @State currentIndex: number = 0;

  // 自定义 tabbar 的布局
  @Builder
  buildTabBar(item: TabBarData) {
    Column() {
      Image(item.icon)
        .width(22)
        .height(22)
        .fillColor(item.name === this.tabsData[this.currentIndex].name ? $r('app.color.primary') :
        $r('app.color.text_secondary'))
      Text(item.title)
        .fontSize(12)
        .fontWeight(400)
        .margin({ top: 5 })
        .fontColor($r(item.name === this.tabsData[this.currentIndex].name ? 'app.color.primary' :
          'app.color.text_secondary'))
    }
  }

  cleanUserToken() {
    const pref = new UserPreferences(getContext())
    pref.setUserToken('')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        ForEach(this.tabsData, (item: TabBarData) => {
          TabContent() {
            if (item.name === 'task') {
              Task()
            } else if (item.name === 'message') {
              Message()
            } else if (item.name === 'my') {
              Mine()
            }
          }.tabBar(this.buildTabBar(item)).backgroundColor(Color.White).clip(false)
        })
      }.clip(false).backgroundColor(Color.White).scrollable(false).onTabBarClick((index: number) => {
        this.currentIndex = index
      })
    }.width('100%').height('100%')
  }
}