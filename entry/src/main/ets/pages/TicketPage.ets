import router from '@ohos.router';

@Entry
@Component
struct TicketPage {
  @State selectedPassengers: string[] = []

  build() {
    Column() {
      // 顶部栏
      Row() {
        Text("🎫 确认订单")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .width('100%').height(60)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .backgroundColor('#7C3AED') // 紫色背景

      // 车次信息卡片
      Row() {
        Column() {
          Text("00:25").fontSize(20).fontWeight(FontWeight.Bold).fontColor('#1E293B')
          Text("始发站").fontSize(14).fontColor('#64748B')
        }.alignItems(HorizontalAlign.Center).layoutWeight(1)

        Column() {
          Text("G1234").fontSize(20).fontWeight(FontWeight.Bold).fontColor('#1E293B')
          Text("8时1分").fontSize(14).fontColor('#64748B')
        }.alignItems(HorizontalAlign.Center).layoutWeight(1)

        Column() {
          Text("08:26").fontSize(20).fontWeight(FontWeight.Bold).fontColor('#1E293B')
          Text("终点站").fontSize(14).fontColor('#64748B')
        }.alignItems(HorizontalAlign.Center).layoutWeight(1)
      }
      .width('90%')
      .padding(20)
      .margin({ top: 20 })
      .backgroundColor('#FFFFFF')
      .borderRadius(20)
      .shadow({ radius: 12, color: '#33000000', offsetX: 0, offsetY: 4 })
      .border({ width: 2, color: '#F472B6' }) // 粉色边框

      // 已选乘车人
      if (this.selectedPassengers.length > 0) {
        Column({ space: 10 }) {
          Text("👥 已选择乘车人")
            .fontSize(18).fontWeight(FontWeight.Medium).margin({ top: 20, bottom: 10 })
          ForEach(this.selectedPassengers, (p: string) => {
            Row() {
              Text("🌸").fontSize(18).margin({ right: 6 })
              Text(p).fontSize(16).fontColor('#374151')
            }
            .padding(10)
            .width('90%')
            .backgroundColor('#FCE7F3') // 粉色底
            .borderRadius(12)
          })
        }
        .width('90%')
      }

      // 选择乘车人按钮
      Button("+ 选择乘车人")
        .width('90%').height(48)
        .backgroundColor('#F59E0B') // 橙色
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .borderRadius(24)
        .margin({ top: 30 })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/SelectPassengerPage',
            params: {
              callback: (list: string[]) => {
                this.selectedPassengers = list
              }
            }
          })
        })

      Blank().layoutWeight(1)
    }
    .width('100%').height('100%')
    .linearGradient({
      angle: 180,
      colors: [
        [0xFFE0F2FE, 0.0], // 渐变起点（浅蓝）
        [0xFFFDF2F8, 1.0]  // 渐变终点（浅粉）
      ]
    })
    .alignItems(HorizontalAlign.Center)

  }
}
