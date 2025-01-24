class AppUtil {
  // 安全区域，top：状态栏高度，bottom：底部导航栏高度
  static safeArea: Margin = {
    left: 0,
    top: 0,
    right: 0,
    bottom: 0
  }

  // 保存安全区域
  static saveSafeArea(area: Margin) {
    AppUtil.safeArea = area
  }
}
export default AppUtil