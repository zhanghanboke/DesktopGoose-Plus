# Desktop Goose Plus

**Desktop Goose v0.3 的增强整合包 —— 下载解压就能跑，不需要编译。**

原程序 *Desktop Goose v0.3* 由 **Sam Chiet** 制作
（<https://samperson.itch.io/desktop-goose>）。本仓库是在它之上用官方
Modding API 做的二次开发整合包。

---

## 这是什么 / 这不是什么

**是** —— 一个可以直接运行的成品。原程序 + `GoosePlus` Mod + 中文说明，全在这个仓库里。

**不是** —— Mod 的源码。这里只有编译好的 `GoosePlus.dll`。

> ⚠️ **这个仓库没有源码。**
> 源码是 15 个 `.cs`（4,847 行，.NET Framework 4.5.2），在开发仓库的 `dev/GoosePlus/` 下。
> 这个仓库是从那个开发仓库的 `dist/DesktopGoose-Plus/` 目录 `git init` 出来的，
> 只装了成品。
> **如果你想要"源码 + 成品"一起发布，应该在外层目录建仓库**，
> 而不是只发布这个文件夹。

---

## 怎么用

1. 右上角 **Code → Download ZIP**（或者 `git clone`）
2. 解压到任意目录 —— **整个文件夹一起解压**，
   `GooseDesktop.exe` 必须和 `Assets\` 在同一层
3. 双击 **`启动 GoosePlus.bat`**
   （或者直接双击 `GooseDesktop.exe`，现在两个效果一样，原因见下面）
4. 屏幕右下角托盘出现一只小鹅图标 → Mod 加载成功
5. 退出：右键托盘图标 →「退出鹅」，或双击 `关闭 Goose.bat`
   （原版要长按 ESC 好几秒才能退，现在不用了）

更啰嗦的说明看 **[`使用说明.txt`](使用说明.txt)**。

---

## 那个烦人的确认框已经去掉了

原程序有个写死的行为：只要 `config.ini` 里 `EnableMods=True`，每次启动都会弹
`Mod Enabler Warning`（"Mods are not created by the maker of Desktop Goose…"）
的是/否框，而且它**不记住**你上次点了什么。**不点「是」的话，任何 Mod 都不会加载。**

本仓库里的 `GooseDesktop.exe` **改过二进制**，这个框不会再弹：

| | |
|---|---|
| 改的地方 | `MainGame::Init()` 里调用 `MessageBox.Show` 的那条 IL |
| 改成什么 | 等长的 `pop pop pop pop ldc.i4.6`（把 4 个参数丢掉、比较结果恒为「是」） |
| 改了多少 | **只有 5 个字节**，文件偏移 `0x4559`：`28 e7 00 00 0a` → `26 26 26 26 1c` |
| 副作用 | 无。不移动任何 IL 偏移、不改分支目标；`EnableMods=False` 时**依然不加载 Mod** |

未改过的原件保留在开发仓库的 `dist/_original-backup/GooseDesktop.exe.orig`，
把它改名成 `GooseDesktop.exe` 覆盖回来即可还原。补丁脚本是
`dev/patch-exe.py`（纯 Python，可重复执行）。

> 包里的 `GoosePlusLauncher.exe` 是**没打补丁时的老办法** —— 它负责在框弹出的
> 一瞬间替你点「是」。现在用不到了，留着只是备用：万一你把 `GooseDesktop.exe`
> 换回了原版，用它启动仍然能正常加载 Mod。

---

## 功能

| # | 功能 | 说明 |
|---|---|---|
| ① | **小伙伴群** | 多只鹅跟着真鹅跑，有独立移动物理、会摆脚。可选**猫**和**柴犬**（照原版画风手绘）。**默认关闭** |
| ② | **托盘菜单 + 全局热键** | 托盘右键是主控制台，见下方热键表 |
| ③ | **皮肤系统 + 平滑彩虹** | 6 套配色（Classic / Midnight / Sunset / Mint / Golden / Void），外加颜色**渐变**过渡的彩虹模式（不是一闪一闪的） |
| ④ | **番茄钟** | 25 分钟专注 / 5 分钟短休 / 15 分钟长休，4 轮后长休。**休息时让鹅叼一张便签到你面前提醒** |
| ⑤ | **鹅的碎碎念** | 118 句中文便签（"我今天想你了" 之类），只在没有专注任务时出现 |
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

---

## 只想要 Mod，不想要整合包

双击 `安装 Mod 到已有版本.bat`，填入你自己那份 Desktop Goose 的目录
（或直接把该目录拖到 bat 上）。它会复制 `GoosePlus.dll`、把 `config.ini` 的
`EnableMods` 改成 `True`，顺便把 `GoosePlusLauncher.exe` 也放过去。

★ 它**不会改你那份 `GooseDesktop.exe`**，所以确认框还会照弹。
  要么用刚复制过去的 `GoosePlusLauncher.exe` 启动，要么用开发仓库里的
  `dev/patch-exe.py` 给你自己的 exe 打补丁。

---

## 关于原程序与许可

**这个仓库里的 Mod 是二次开发成果**，但原程序 **Desktop Goose v0.3** 的作者
Sam Chiet 在自带的 `Read me! Honk.txt` 里明确写了：

> *"Also, don't redistribute this software on your own! Link back to the itch page
> (on samperson.itch.io), or better yet, the YouTube video…"*

而本仓库为了方便大家**下载即用**，打包了原程序文件（`GooseDesktop.exe`、`MMQ.dll`、
音效等）。**并且 `GooseDesktop.exe` 是被改过的** —— 为了去掉那个每次启动都弹的
确认框，二进制里有 5 个字节跟原版不一样。未改过的原件在开发仓库的
`dist/_original-backup/`。

如果你在意"不要二次分发"这一点：去官方页面
<https://samperson.itch.io/desktop-goose> 下载原程序，然后只取 Mod 部分
（`Assets/Mods/GoosePlus/`），自己用 `dev/patch-exe.py` 给 exe 打补丁
（或直接用 `GoosePlusLauncher.exe`）。

音效取自 *Untitled Goose Game*，版权归 House House。
表情包**全部不是本项目原创**，来源见 [`Assets/Images/MemeAttributions.txt`](Assets/Images/MemeAttributions.txt)；
如果某张图的权利人希望它被移除，开个 issue 我立刻删。

---

## 致谢

- **Sam Chiet** —— Desktop Goose 的作者，还留了 Modding API 和官方 Mod 模板
- **House House** —— *Untitled Goose Game*，鹅叫的来源
- 表情包来源：haowallpaper.com、哲风壁纸（详见署名文件）
