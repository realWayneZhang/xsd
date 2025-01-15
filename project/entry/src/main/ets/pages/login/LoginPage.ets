import { LoginApi } from '../../api/user';
import { AccountForm } from '../../models'

@Entry
@Component
struct LoginPage {
  // 控制 loading
  @State showLoading: boolean = false
  @State accoutForm: AccountForm = {
    account: '',
    password: ''
  }

  // 登录方法
  async submitLogin()  {
    // AlertDialog.show({ message: JSON.stringify(this.accoutForm) })

    // 显示 loading
    this.showLoading = true;
    // 调用登录接口
    try {
      const res = await LoginApi(this.accoutForm)
       AlertDialog.show({
         message: JSON.stringify(res)
       })
    } catch (e) {
      console.log('error', e);
    } finally {
      this.showLoading = false;
    }
  }

  validating(): boolean {
    if (this.accoutForm.account && this.accoutForm.password) {
      return true
    }
    return false
  }

  @Styles
  loginInputStyle() {
    .backgroundColor('#fff').height(50).border({
      width: {
        bottom: 1
      },
      color: $r('app.color.background_divider')
    }).borderRadius(0)
  }

  build() {
    Column() {
      // 顶部标题
      Text('小时达')
        .fontSize(18)
        .height(28)
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })
      // 账号登录标题
      Row() {
        Text('账号登录').fontSize(24).fontWeight(FontWeight.Bold)
        Row() {
          Text('手机号登录').fontSize(16).fontColor($r('app.color.primary')).fontWeight(600)
          Image($r('app.media.ic_angle')).width(10).height(10).margin({ left: 5 })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 50, bottom: 50 })

      // 账号输入框
      TextInput({ placeholder: '请输入账号', text: $$this.accoutForm.account }).loginInputStyle()
      // 密码输入框
      TextInput({ placeholder: '请输入密码', text: $$this.accoutForm.password })
        .loginInputStyle()
        .type(InputType.Password)
      // 登录按钮
      Button({ type: ButtonType.Capsule }) {
        Row() {
          if (this.showLoading) {
            LoadingProgress().width(20).height(20).color($r('app.color.white')).margin({ right: 5 })
          }
          Text('登录').fontColor(Color.White)
        }

      }
      .enabled(this.validating())
      .width('100%')
      .height(50)
      .margin({ top: 50 })
      .backgroundColor(this.validating() ? $r('app.color.primary') : $r('app.color.primary_disabled'))
      .onClick(() => this.submitLogin())

    }.width('100%').height('100%').padding({ left: 32, right: 32 })
  }
}