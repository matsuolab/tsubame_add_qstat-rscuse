# tsubame_add_qstat-rscuse

TSUBAME にはノードの混雑状況を簡単に確認する `qstat --rscuse` 相当のコマンドがなかったので作成しました。

他の HPC 環境（例: miyabi, Wisteria）で利用できる `qstat --rscuse` / `pjstat --rscuse` に相当する簡易ツールです。

## Quick Start
コピペでOK
```bash
cd "$HOME"
git clone https://github.com/matsuolab/tsubame_add_qstat-rscuse.git
cd tsubame_add_qstat-rscuse
bash add_qstat-rscuse.sh
```

## Example Output

```text
Nodes total              : 235
Slots total              : 45120
Slots used               : 40500
Slots reserved           : 15360
Slots idle physical      : 4620
Utilization used/total   : 89.8%
Idle physical/total      : 10.2%
Idle node equivalent     : 24.1 nodes
Nodes with idle slot     : 71
Nodes with >=64 idle     : 20
Nodes with >=128 idle    : 16
Nodes with >=192 idle    : 14
```

## Interpretation

- `slot` は CPU スレッド数に対応します。
- TSUBAME では 1 ノードあたり 192 スレッドのため、`Slots total` は  
  `ノード数 × 192` で計算されています。
- `Nodes with >=192 idle` は、192 スロットすべてが空いているノード数（= full node 利用可能数）を示します。
- 上の例では、14 ノードが full node として利用可能です。
