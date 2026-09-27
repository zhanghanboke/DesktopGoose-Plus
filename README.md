# Desktop Goose Plus

> 给 **Desktop Goose** 写的一整套增强 Mod —— 把那只只会捣乱的鹅，变成一个能一直开在
> 桌面上的伙伴：一群小伙伴、托盘控制台和全局热键、皮肤和渐变彩虹、番茄钟，
> 还会叼着便签跟你碎碎念。

**v1.2.0** · Windows · 下载解压即用，**不用编译**

---

## 这是什么 / 有什么用

**Desktop Goose** 是一只会在你桌面上乱走、叼走鼠标、贴便签捣乱的鹅。很好玩，
但玩两天就腻了 —— 它只有一只、只会捣乱、没有开关、也没法让它安静。

**GoosePlus 是我给它写的增强 Mod**，目标是把「玩具」变成「能一直开着的桌面宠物」：

| 你想要的 | 它现在能做到 |
|---|---|
| 多点陪伴感 | 一群小伙伴（鹅 / 猫 / 柴犬）会跟着真鹅跑，有独立移动物理、会摆脚 |
| 别太吵 | 番茄钟专注期它会安静下来 —— 不叫、不弹窗，但照常走动陪着你 |
| 帮我记着休息 | 休息时它叼着一张便签走到你面前提醒 |
| 想让它说话 | 118 句中文碎碎念（"我今天想你了"、"你在干嘛呀"），带颜文字 |
| 换换口味 | 6 套配色 + 颜色**渐变**过渡的彩虹模式（不是一闪一闪的） |
| 管住它 | 10 个全局热键 + 托盘右键菜单 + 叼东西的冷却间隔 |

说白了就三件事：**陪着你**（小伙伴 + 碎碎念）、**帮你干活**（番茄钟 + 便签提醒）、
**不烦你**（专注期静音 + 冷却节流 + 随时一键暂停）。原版是个梗，这个版本是能日常开着的。

---

## 快速开始

1. 右上角 **Code → Download ZIP**（或者 `git clone`）
2. 解压到任意目录 —— **整个文件夹一起解压**，
   `GooseDesktop.exe` 必须和 `Assets\` 在同一层
3. 双击 **`启动 GoosePlus.bat`**
   （或者直接双击 `GooseDesktop.exe`，两个效果一样，原因见下面「那个确认框」）
4. 屏幕右下角托盘出现一只小鹅图标 → Mod 加载成功
5. 退出：右键托盘图标 →「退出鹅」，或双击 `关闭 Goose.bat`
   （原版要长按 ESC 好几秒才能退，现在不用了）

更啰嗦的说明看 **[`使用说明.txt`](使用说明.txt)**。

---

## 功能

| # | 功能 | 说明 |
|---|---|---|
| ① | **小伙伴群** | 多只鹅跟着真鹅跑，有独立移动物理、会摆脚。可选**猫**和**柴犬**（照原版画风手绘）。**默认关闭**，在托盘菜单里开 |
| ② | **托盘菜单 + 全局热键** | 托盘右键就是主控制台：开小伙伴、换皮肤、开始番茄钟、暂停鹅…… |
| ③ | **皮肤系统 + 平滑彩虹** | 6 套配色（Classic / Midnight / Sunset / Mint / Golden / Void），外加颜色**渐变**过渡的彩虹模式 |
| ④ | **番茄钟** | 25 分钟专注 / 5 分钟短休 / 15 分钟长休，4 轮后长休。**休息时让鹅叼一张便签到你面前提醒** |
| ⑤ | **鹅的碎碎念** | 118 句中文便签，只在没有专注任务时出现 |
| ⑥ | **叼东西的冷却间隔** | 给鹅的"手速"加上限。便签和表情包**分开设**，默认 15 / 20 分钟，`0` = 不限制 |

另外还换掉了内容：表情包 **26 张**（20 张 4K 壁纸 + 6 张二次元/风景），
全部压缩过 —— `Assets/Images/Memes/` 一共只有 **7.1 MB**；
便签文案也换成了中文，首次运行会生成 118 句碎碎念。

### 热键

| 热键 | 作用 |
|---|---|
| `Ctrl+Alt+G` | 召唤鹅到鼠标位置 |
| `Ctrl+Alt+H` | 鸣叫 |
| `Ctrl+Alt+P` | 暂停 / 继续 |
| `Ctrl+Alt+K` | 换下一个皮肤 |
| `Ctrl+Alt+B` | 小伙伴 开 / 关 |
| `Ctrl+Alt+O` | 把鹅赶出屏幕 |
| `Ctrl+Alt+R` | 立刻弹提醒 |
| `Ctrl+Alt+J` | 彩虹渐变 开 / 关 |
| `Ctrl+Alt+T` | 番茄钟 开始 / 暂停 |
| `Ctrl+Alt+N` | 跳过当前阶段 |

---

## 配置

| 文件 | 管什么 |
|---|---|
| `Assets/Mods/GoosePlus/settings.ini` | **Mod 自己的设置**，每个键都有中文注释。托盘菜单里改的任何东西都会写回这个文件 |
| `config.ini` | **原程序自己的设置**（音量、随机漫游间隔、鹅的默认配色……）。`EnableMods` 必须为 `True`，否则 Mod 不会加载 |

`settings.ini` 里几个容易看错的键：

| 键 | 默认 | 说明 |
|---|---|---|
| `GhostCount` | `0` | 小伙伴数量。**0 = 关闭**，想开在托盘菜单里选 0/1/3/5/8/12 |
| `CompanionKind` | `Mix` | 小伙伴种类：`Mix`（混合）/ `Goose` / `Cat` / `Shiba` |
| `Rainbow` / `RainbowSpeed` | `False` / `22.0` | 彩虹渐变开关和速度（度/秒） |
| `PomodoroQuietMouse` | `False` | ★ 专注期**额外**不让鹅抢鼠标。开了之后「在鹅身上点一下它就来抢鼠标」会**完全失效**，而且看不出来（鹅照常走动）—— 想要彻底安静再打开 |
| `DragNotepadMinutes` / `DragMemeMinutes` | `15` / `20` | 叼便签 / 叼表情包的冷却间隔（分钟），`0` = 不限制 |

> 仓库里跟踪的 `settings.ini` 是**默认值**。你在托盘菜单里改过设置之后，这个文件
> 就变成你个人的配置了，`git status` 里显示 modified 是正常的 ——
> 不想把自己的设置传上去就 `git checkout -- Assets/Mods/GoosePlus/settings.ini`。

---

## 关于那个确认框 —— 已经去掉了

原程序有个很烦的行为：只要 `config.ini` 里 `EnableMods=True`，每次启动都会弹
`Mod Enabler Warning`（"Mods are not created by the maker of Desktop Goose…"）
的是/否框，而且它**不记住**你上次点了什么。**不点「是」的话，任何 Mod 都不会加载** ——
表现成"Mod 没反应"，而不是报错。

**本包里的 `GooseDesktop.exe` 改过二进制，这个框不会再弹了：**

| | |
|---|---|
| 改的地方 | `MainGame::Init()` 里调用 `MessageBox.Show` 的那条 IL |
| 改成什么 | 等长的 `pop pop pop pop ldc.i4.6`（把 4 个参数丢掉、比较结果恒为「是」） |
| 改了多少 | **只有 5 个字节**，文件偏移 `0x4559`：`28 e7 00 00 0a` → `26 26 26 26 1c` |
| 为什么安全 | `call` 指令固定 5 字节，替换后长度不变 ⇒ **不移动任何 IL 偏移、不改分支目标**；`EnableMods=False` 时**依然不加载 Mod**，开关语义没变 |

所以现在双击 `GooseDesktop.exe` 和双击 `启动 GoosePlus.bat` 是一样的。
**想还原原版**：去官方页面 <https://samperson.itch.io/desktop-goose> 重新下一份，
覆盖掉这个 `GooseDesktop.exe` 就行（但那样确认框会回来）。

> 包里的 `GoosePlusLauncher.exe` 是**没打补丁时的老办法** —— 它负责在框弹出的
> 一瞬间替你点「是」。现在用不到了，留着只是备用：万一你把 `GooseDesktop.exe`
> 换回了原版，用它启动仍然能正常加载 Mod。

---

## 技术栈

### Mod 本体：`Assets/Mods/GoosePlus/GoosePlus.dll`

| | |
|---|---|
| 语言 / 运行时 | **C# 7.3** + **.NET Framework 4.5.2**（程序集里写的 TFM 是 `.NETFramework,Version=v4.5.2`） |
| 版本 | `1.2.0` |
| 形态 | 类库（DLL），由原程序的 Modding API 在**运行时**加载，不改原程序源码 |
| 引用的程序集 | `mscorlib`、`System`、`System.Core`、**`System.Drawing`**、**`System.Windows.Forms`**、`GooseModdingAPI` |

用到的东西：

| 用途 | 技术 |
|---|---|
| 宿主接口 | `GooseModdingAPI.dll` —— `GooseShared` 命名空间（`InjectionPoints` / `API` / `GooseTaskInfo` / `GooseEntity` / `GooseRenderData` / `Rig` / `ProceduralFeets`）和 `SamEngine` 命名空间（`Time` / `SamMath` / `Deck` / `Input`） |
| 托盘菜单 / 窗口 | **WinForms** —— `NotifyIcon`、`ContextMenuStrip`、`ToolStripMenuItem`、`Timer`、`Screen` |
| 画猫和柴犬、画托盘图标 | **GDI+**（`System.Drawing` / `Drawing2D`）—— `Graphics`、`Pen`、`SolidBrush`、`Color`、`PointF`。小动物是**纯代码画的**（复用原版笔刷，身体每节都是"圆头粗线"胶囊，先描边再填充），托盘那个 `.ico` 也是运行时现画出来的 |
| 10 个全局热键 | **Win32 P/Invoke** —— `user32.dll` 的 `RegisterHotKey` / `UnregisterHotKey` |
| 修托盘菜单"一闪就关" | 同上 —— `user32.dll` 的 `PeekMessage`（问题出在宿主自己的消息循环上） |
| 改宿主行为 | **反射**（`System.Reflection`）—— `FieldInfo` / `MethodInfo` / `BindingFlags` 直接读写宿主内部的**私有**字段和方法：随机任务池、各种开关、以及宿主的 idle 回调 |

> **为什么必须是 .NET Framework 4.5.2**：原程序就是 4.5.2 的 WinForms 应用，
> 它只能加载同框架的 DLL —— .NET Core / .NET 5+ 编译出来的 DLL 根本进不去。

### 备用启动器：`GoosePlusLauncher.exe`

只用 `user32.dll` 的 `FindWindow` / `EnumChildWindows` / `GetDlgCtrlID` /
`GetWindowText` / `SendMessage`（`BM_CLICK`）去点掉那个确认框。
**故意不引用 WinForms** —— 所以它只有 7.5 KB，启动时也不会闪任何窗口。

### 去确认框：改 IL，不改源码

原程序没有开放源码，所以是直接改二进制。`call` 指令的编码是
`0x28` + 4 字节元数据 token，**固定 5 字节**，把它换成等长的
`pop ×4`（丢掉 4 个参数）+ `ldc.i4.6`（`DialogResult.Yes` = 6），
于是 `MessageBox.Show` 不被调用、后面的 `bne.un.s` 比较恒等而不跳转，
直接落到 `ModSupport.LoadMods()`。**只动 5 个字节**，不移动任何 IL 偏移。

### 原程序

`GooseDesktop.exe` 是 **Desktop Goose v0.3**（.NET Framework 4.5.2 WinForms，
同样引用 `GooseModdingAPI`），只改了上面那 5 个字节。音效库是 `MMQ.dll`。

---

## 目录

```
├── GooseDesktop.exe            原程序（已打补丁：去掉 Mod 确认框）
├── GooseModdingAPI.dll         官方 Modding API —— Mod 靠它被加载
├── MMQ.dll                     原程序的音频库
├── GoosePlusLauncher.exe       备用启动器（没打补丁时替你点「是」）
├── config.ini                  原程序配置（EnableMods=True）
├── 启动 GoosePlus.bat          ★ 双击这个
├── 关闭 Goose.bat              退出
├── 安装 Mod 到已有版本.bat      只把 Mod 装到你自己的 Desktop Goose 里
├── 使用说明.txt                ★ 完整中文说明（6 节）
├── Read me! Honk.txt           原作者的说明（请读一下）
├── changelog.txt               原程序更新日志
├── README.md                   本文件
└── Assets/
    ├── Images/
    │   ├── Memes/              26 张表情包（20 张 cover-*.jpg + 6 张壁纸）
    │   ├── MemeAttributions.txt   ★ 表情包逐张来源署名
    │   └── OtherGfx/heart.png
    ├── Sound/
    │   ├── Music/              背景音乐（Rename me to just Music.mp3）
    │   └── NotEmbedded/        鹅叫、踩泥、咬东西的音效
    ├── Text/NotepadMessages/   原程序自带的 6 句英文便签
    └── Mods/GoosePlus/         ★ Mod 本体
        ├── GoosePlus.dll
        └── settings.ini
```

**第一次运行之后**，`Assets/Mods/GoosePlus/` 下会多出这些东西 —— 全是自动生成的，
已在 `.gitignore` 里排除，所以仓库里看不到：

| 生成的东西 | 是什么 |
|---|---|
| `Messages/Idle/*.txt` | 118 句碎碎念，一个文件一句，你可以自己改 |
| `Skins/*.skin` | 6 套内置皮肤 |
| `gooseplus.ico` | 托盘图标（运行时现画的） |
| `gooseplus.log` | 运行日志，排查问题看它 |
| `taskids.txt` | 原程序注册的全部任务 ID，写新 Mod 时有用 |
| `Assets/Text/NotepadMessages/gp-idle-*.txt` | 同步进游戏便签目录的那 118 句 |

---

## 只想要 Mod，不想要整合包

双击 `安装 Mod 到已有版本.bat`，填入你自己那份 Desktop Goose 的目录
（或直接把该目录拖到 bat 上）。它会复制 `GoosePlus.dll`、把 `config.ini` 的
`EnableMods` 改成 `True`，顺便把 `GoosePlusLauncher.exe` 也放过去。

★ 它**不会改你那份 `GooseDesktop.exe`**，所以那个确认框还会照弹 ——
  用刚复制过去的 `GoosePlusLauncher.exe` 启动就不会看到了。

---

## 致谢

这个项目能成立，首先得谢 **Sam Chiet** —— **Desktop Goose v0.3 的作者**。
他不仅做了那只鹅，还留了一套正经的 **Modding API**（`GooseModdingAPI.dll`）
和官方 Mod 模板，否则这里的功能一个都写不出来。原程序请去官方页面支持他：
<https://samperson.itch.io/desktop-goose>

- **Sam Chiet** —— Desktop Goose 原作者。他自带的 `Read me! Honk.txt` 里写了
  *"don't redistribute this software on your own! Link back to the itch page…"*，
  而本仓库为了方便"下载即用"打包了原程序文件（`GooseDesktop.exe`、`MMQ.dll`、音效等），
  且 `GooseDesktop.exe` 有 5 个字节被改过（为了去掉确认框）。如果你在意这一点，
  请去上面那个官方页面下载原程序，只取本仓库的 Mod 部分
  （`Assets/Mods/GoosePlus/` 整个文件夹丢进你自己的 `Assets/Mods/` 即可）。
- **House House** —— *Untitled Goose Game*，鹅叫音效的来源。
- 表情包**全部不是本项目原创**，来源见
  [`Assets/Images/MemeAttributions.txt`](Assets/Images/MemeAttributions.txt)
  （来自 haowallpaper.com、哲风壁纸）。如果某张图的权利人希望它被移除，
  开个 issue 我立刻删。
