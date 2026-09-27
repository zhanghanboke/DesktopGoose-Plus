# Desktop Goose Plus

> 给 **Desktop Goose** 写的一整套增强 Mod —— 把那只只会捣乱的鹅，变成一个能一直开在
> 桌面上的伙伴：多了一群小伙伴、有托盘控制台和全局热键、有皮肤和渐变彩虹、有番茄钟、
> 还会叼着便签跟你碎碎念。

版本 **1.2.0** · C# / .NET Framework 4.5.2 · 下载解压即用

---

## 这是什么

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

### 有什么用

说白了就三件事：**陪着你**（小伙伴 + 碎碎念）、**帮你干活**（番茄钟 + 便签提醒）、
**不烦你**（专注期静音 + 冷却节流 + 随时一键暂停）。原版是个梗，这个版本是能日常开着的。

---

## 怎么用

1. 右上角 **Code → Download ZIP**（或者 `git clone`）
2. 解压到任意目录 —— **整个文件夹一起解压**，
   `GooseDesktop.exe` 必须和 `Assets\` 在同一层
3. 双击 **`启动 GoosePlus.bat`**（或者直接双击 `GooseDesktop.exe`，效果一样）
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

另外还换掉了内容：便签池 **124 张**，表情包从 6 张扩到 **26 张**并全部压缩
（目录 75 MB → 7 MB，整合包 77 MB → 9.6 MB）。

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

改 **`Assets/Mods/GoosePlus/settings.ini`**（每个键都有中文注释），
或者直接用托盘菜单 —— 菜单里的改动会写回这个文件。

> 仓库里跟踪的是**默认值**。你在托盘菜单里改过设置之后这个文件就变成你个人的
> 配置了，`git status` 里显示 modified 是正常的；不想把自己的设置传上去就
> `git checkout -- Assets/Mods/GoosePlus/settings.ini`。

原版 `config.ini` 在包根目录，`EnableMods` 必须为 `True`，否则 Mod 不会加载。

---

## 技术栈

### Mod 本体（`GoosePlus.dll`）

| | |
|---|---|
| 语言 / 运行时 | **C# 7.3** + **.NET Framework 4.5.2**（`net452`） |
| 产物 | 类库（DLL），由原程序的 Modding API 在运行时加载 |
| 宿主接口 | `GooseModdingAPI.dll` 的 `GooseShared` / `SamEngine` 命名空间：`IMod.Init()`、`InjectionPoints` 的 6 个注入点（PreTick / PostTick / PreUpdateRig / PostUpdateRig / PreRender / PostRender）、`API.Goose`、`API.TaskDatabase`、`GooseEntity` |
| UI | **WinForms** —— 托盘图标 + 右键菜单（`NotifyIcon` / `ToolStripMenuItem`）、便签窗口 |
| 绘图 | **GDI+**（`System.Drawing` / `Drawing2D` / `Imaging`）—— 猫和柴犬是**纯代码画的**（复用原版笔刷，身体每节都是"圆头粗线"胶囊，先描边再填充）；托盘图标也是 GDI+ 现画成 `.ico` |
| 全局热键 | **Win32 P/Invoke** —— `user32!RegisterHotKey` / `UnregisterHotKey`，10 个组合键 |
| 宿主改造 | **反射**（`System.Reflection`）直接读写宿主的**私有静态字段**：`GooseTaskDatabase.randomlyPickableTaskIndices`（随机任务池）、`GooseConfig.settings.*`（各种开关）、`MainGame.idleHandler` |
| 其他 | `System.Threading`、`System.Diagnostics`、`System.Globalization` |

> **为什么必须是 `net452`**：原程序是 .NET Framework 4.5.2 的 WinForms 应用，
> 它只能加载同框架的 DLL —— .NET Core / 5+ 的 DLL 根本进不去。

### 去掉启动确认框：改 IL，不改源码

原程序每次启动都会弹一个 `Mod Enabler Warning` 的是/否框，**不点「是」就不加载任何
Mod**，而且它不记住你的选择。我没有原程序源码，所以直接改二进制：

`MainGame::Init()` 里那条 `call MessageBox::Show(...)` 的编码是
`0x28` + 4 字节元数据 token（**正好 5 字节**），替换成**等长**的
`pop ×4 + ldc.i4.6`（把 4 个参数丢掉，比较结果恒为「是」）。

只动 5 个字节、**不移动任何 IL 偏移、不改分支目标**，`EnableMods=False` 时依然
不加载 Mod。工具是纯 Python（只用 `struct` 走 PE 节表算文件偏移）。

| | |
|---|---|
| 改的地方 | 文件偏移 `0x4559`：`28 e7 00 00 0a` → `26 26 26 26 1c` |
| 验证方式 | A/B 对照 —— 拿未打补丁的原件跑，会弹框且**日志里没有** "Mod loaded"；打补丁版不弹框且正常加载 |

### 资源与打包流水线（Python）

| | |
|---|---|
| 表情包处理 | **Python 3 + Pillow** —— 从壁纸库挑 26 张，统一缩放/压缩，77 MB → 7 MB |
| 解码交叉验证 | **ffmpeg** —— 和 PIL 两个独立解码器各跑一遍，确认 26 张图都能读 |
| 署名反查 | Python 读壁纸库的 `covers.json`，按挑选顺序精确还原每张图的来源页 |
| 打包 | **Python `zipfile`**（或 PowerShell `Compress-Archive`）—— 中文文件名必须带 UTF-8 标志位，否则换机器解压乱码 |
| 自动化验证 | **Python `ctypes` + `user32!EnumWindows`** —— 枚举目标进程的窗口来断言"有没有弹框"，不用截图（避免把用户桌面上其他窗口拍进去） |

### 构建

**dotnet SDK / MSBuild** + SDK 风格 `.csproj`；一条 `build-package.bat` 串起
「编译 → 组包 → 打 zip → 复核补丁」，另有端到端冒烟脚本。

---

## 目录

```
├── GooseDesktop.exe            原程序（已打补丁：去掉 Mod 确认框）
├── GooseModdingAPI.dll         官方 Modding API
├── MMQ.dll                     原程序的音频库
├── GoosePlusLauncher.exe       备用启动器（没打补丁时替你点「是」）
├── config.ini                  原程序配置（EnableMods=True）
├── 启动 GoosePlus.bat          ★ 双击这个
├── 关闭 Goose.bat              退出
├── 安装 Mod 到已有版本.bat      只把 Mod 装到你自己的 Desktop Goose 里
├── 使用说明.txt                ★ 完整中文说明
├── Read me! Honk.txt           原作者的话（请读一下）
├── changelog.txt               原程序更新日志
└── Assets/
    ├── Images/Memes/           26 张表情包
    ├── Images/MemeAttributions.txt   ★ 表情包来源署名
    ├── Sound/                  音效
    ├── Text/NotepadMessages/   游戏自带的 6 句便签
    └── Mods/GoosePlus/         ★ Mod 本体
        ├── GoosePlus.dll
        └── settings.ini
```

首次运行后 `Assets/Mods/GoosePlus/` 下会多出 `Messages/`、`Skins/`、
`gooseplus.ico`、`gooseplus.log` 等 —— 都是自动生成的，已在 `.gitignore` 里排除。

> 这个仓库是**成品包**（下载就能跑）。Mod 的源码是 15 个 `.cs`、4,847 行，
> 在开发仓库的 `dev/GoosePlus/` 下。

---

## 只想要 Mod，不想要整合包

双击 `安装 Mod 到已有版本.bat`，填入你自己那份 Desktop Goose 的目录
（或直接把该目录拖到 bat 上）。它会复制 `GoosePlus.dll`、把 `config.ini` 的
`EnableMods` 改成 `True`，顺便把 `GoosePlusLauncher.exe` 也放过去。

★ 它**不会改你那份 `GooseDesktop.exe`**，所以确认框还会照弹。
  要么用刚复制过去的 `GoosePlusLauncher.exe` 启动，要么用开发仓库里的
  `dev/patch-exe.py` 给你自己的 exe 打补丁。

---

## 致谢

这个项目能成立，首先得谢 **Sam Chiet** —— **Desktop Goose v0.3 的作者**。
他不仅做了那只鹅，还留了一套正经的 **Modding API** 和官方 Mod 模板，
否则这里的东西一个都写不出来。原程序请去官方页面支持他：
<https://samperson.itch.io/desktop-goose>

- **Sam Chiet** —— Desktop Goose 原作者。他自带的 `Read me! Honk.txt` 里写了
  *"don't redistribute this software on your own! Link back to the itch page…"*，
  而本仓库为了方便"下载即用"打包了原程序文件（`GooseDesktop.exe`、`MMQ.dll`、音效等），
  且 `GooseDesktop.exe` 有 5 个字节被改过（为了去掉确认框）。如果你在意这一点，
  请去上面那个官方页面下载原程序，只取本仓库的 Mod 部分
  （`Assets/Mods/GoosePlus/`），再用 `dev/patch-exe.py` 给你自己的 exe 打补丁。
- **House House** —— *Untitled Goose Game*，鹅叫音效的来源。
- 表情包**全部不是本项目原创**，来源见
  [`Assets/Images/MemeAttributions.txt`](Assets/Images/MemeAttributions.txt)
  （来自 haowallpaper.com、哲风壁纸）。如果某张图的权利人希望它被移除，
  开个 issue 我立刻删。
