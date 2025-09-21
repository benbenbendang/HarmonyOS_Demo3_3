import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

interface GeneratedTypeLiteralInterface_1 {
  callback?: (list: string[]) => void;
}

@Entry
@Component
struct SelectPassengerPage {
  @State passengerList: string[] = ['张三', '李四', '王五']
  @State selected: Set<string> = new Set()
  @State newPassenger: string = ''

  private callback: ((list: string[]) => void) | undefined

  aboutToAppear() {
    const p = router.getParams() as GeneratedTypeLiteralInterface_1
    this.callback = p?.callback
  }

  build() {
    Column() {
      // 顶部栏
      Row() {
        Text("⬅ 返回")
          .fontSize(16)
          .fontColor(Color.White)
          .margin({ left: 12 })
          .onClick(() => router.back())
        Blank().layoutWeight(1)
        Text("🌟 选择乘车人")
          .fontSize(20).fontWeight(FontWeight.Bold).fontColor(Color.White)
        Blank().layoutWeight(1)
      }
      .width('100%').height(60)
      .alignItems(VerticalAlign.Center)
      .backgroundColor('#F472B6') // 粉色背景

      // 添加新乘车人
      Row({ space: 10 }) {
        TextInput({ placeholder: "输入乘车人姓名 ✍️" })
          .width(220).height(38)
          .borderRadius(10)
          .backgroundColor('#FFF')
          .padding({ left: 10 })
          .onChange((val: string) => this.newPassenger = val)

        Button("添加")
          .width(70).height(38)
          .backgroundColor('#10B981')
          .fontColor(Color.White)
          .borderRadius(10)
          .onClick(() => {
            if (this.newPassenger.trim().length > 0) {
              this.passengerList.push(this.newPassenger.trim())
              this.newPassenger = ''
              promptAction.showToast({ message: "🌸 添加成功" })
            }
          })
      }
      .margin({ top: 20, left: 20, right: 20 })

      // 乘车人列表
      Column({ space: 12 }) {
        ForEach(this.passengerList, (p: string) => {
          Row() {
            Checkbox({ name: p, group: "passenger" })
              .select(this.selected.has(p))
              .onChange((isCheck: boolean) => {
                if (isCheck) this.selected.add(p)
                else this.selected.delete(p)
              })
            Text("👤 " + p).fontSize(16).margin({ left: 10 }).fontColor('#111827')
          }
          .padding(14)
          .width('90%')
          .backgroundColor('#E0F2FE') // 浅蓝底
          .borderRadius(14)
          .shadow({ radius: 6, color: '#22000000', offsetX: 0, offsetY: 3 })
        })
      }
      .margin({ top: 20 })
      .alignItems(HorizontalAlign.Center)

      Blank().layoutWeight(1)

      // 底部确认按钮
      Button("✨ 确认选择")
        .width('90%').height(48)
        .backgroundColor('#7C3AED') // 紫色
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .borderRadius(24)
        .margin({ bottom: 20 })
        .onClick(() => {
          if (this.callback) this.callback(Array.from(this.selected))
          router.back()
        })
    }
    .width('100%').height('100%')
    .linearGradient({
      angle: 180,
      colors: [
        [0xFFFDF2F8, 0.0], // 渐变起点
        [0xFFE0F2FE, 1.0]  // 渐变终点
      ]
    })


  }
}
