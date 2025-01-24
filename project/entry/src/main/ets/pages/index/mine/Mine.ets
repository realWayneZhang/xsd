import { display } from "@kit.ArkUI"
import AppUtil from "../../../../util/AppUtil"

@Component
struct Mine {
  @State screenWith: number = 0
  @State screenHeight: number = 0

  aboutToAppear(): void {
    this.screenWith = display.getDefaultDisplaySync().availableWidth
    this.screenHeight = display.getDefaultDisplaySync().height
  }

  build() {
    Column() {
      // 用户信息
      Column() {
        Image($r('app.media.ic_avatar_driver')).width(67).height(67).borderRadius(33.5)
        Text('李明')
          .fontSize(18)
          .fontColor(Color.White)
          .fontWeight(600)
          .lineHeight(25)
          .margin({ top: 9, bottom: 9 })
        Text('司机编号：666666666').fontColor(Color.White).fontSize(14).fontWeight(400).lineHeight(20)
        Text('手机号：19112012580')
          .fontColor(Color.White)
          .fontSize(14)
          .fontWeight(400)
          .lineHeight(20)
          .margin({ top: 10 })
      }

      .width('100%')
      .padding({ bottom: 90 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .height(px2vp(292.0 * this.screenWith / 375.0)) //
      .backgroundImageSize(ImageSize.Cover).backgroundColor(Color.Green)
      .backgroundImage($r('app.media.bg_page_my'))
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])

      // 本月任务
      Column() {
        Text('- 本月任务 -')
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
          .lineHeight(20)
          .margin({ bottom: 10 })

        Row() {
          Column() {
            Text('18').fontSize(18).fontColor($r('app.color.text_primary')).lineHeight(25)
            Text('任务总量').fontSize(12).fontColor($r('app.color.text_primary')).margin({ top: 5 })
          }.layoutWeight(1).justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)

          Column() {
            Text('18').fontSize(18).fontColor($r('app.color.text_primary')).lineHeight(25)
            Text('完成任务量').fontSize(12).fontColor($r('app.color.text_primary')).margin({ top: 5 })
          }.layoutWeight(1).justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)

          Column() {
            Text('18').fontSize(18).fontColor($r('app.color.text_primary')).lineHeight(25)
            Text('运输里程(km)').fontSize(12).fontColor($r('app.color.text_primary')).margin({ top: 5 })
          }.layoutWeight(1).justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
        }.width('100%')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        top: 14,
        bottom: 14,
        left: 15,
        right: 15
      })
      .backgroundColor(Color.White)
      .margin({ top: -90, left: 15, right: 15 })
      .borderRadius(15)
      .shadow({ radius: 15, color: '#10000000' })

      // 选项列表
      Column() {
        Row() {
          Text('车辆信息').fontSize(16).fontColor($r('app.color.text_primary')).lineHeight(20)
          Image($r('app.media.ic_btn_more')).width(24).height(24)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 10,
          bottom: 10
        })
        .border({ width: { bottom: 1 }, color: '#F1F1F1' })

        Row() {
          Text('任务数据').fontSize(16).fontColor($r('app.color.text_primary')).lineHeight(20)
          Image($r('app.media.ic_btn_more')).width(24).height(24)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 10,
          bottom: 10
        })
        .border({ width: { bottom: 1 }, color: '#F1F1F1' })

        Row() {
          Text('系统设置').fontSize(16).fontColor($r('app.color.text_primary')).lineHeight(20)
          Image($r('app.media.ic_btn_more')).width(24).height(24)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 10,
          bottom: 10
        })
        .border({ width: { bottom: 1 }, color: '#F1F1F1' })
      }
      .backgroundColor(Color.White)
      .padding({ left: 15, right: 15 })
      .margin({ top: 15, left: 15, right: 15 })
      .borderRadius(15)
      .shadow({ radius: 15, color: '#10000000' })
    }.width('100%').height('100%').backgroundColor('#FFF8F8F8')
  }
}

export default Mine