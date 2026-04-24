import pandas as pd
import matplotlib.pyplot as plt

years = [1, 2, 3]
as_is = {
    "Инфраструктура": [480, 520, 560],
    "Лицензии": [320, 340, 360],
    "Сопровождение": [850, 900, 950],
    "Потери аналитиков": [180, 200, 220]
}
to_be = {
    "Инфраструктура": [380, 410, 440],
    "Лицензии": [100, 110, 120],
    "Сопровождение": [720, 750, 780],
    "Потери аналитиков": [40, 45, 50]
}
migration_cost = 500
df_as_is = pd.DataFrame(as_is, index=[f"Год {y}" for y in years])
df_to_be = pd.DataFrame(to_be, index=[f"Год {y}" for y in years])

df_as_is["Итого"] = df_as_is.sum(axis=1)
df_to_be["Итого"] = df_to_be.sum(axis=1)


savings = df_as_is["Итого"] - df_to_be["Итого"]
cumulative_savings = savings.cumsum() - migration_cost


fig, ax = plt.subplots(figsize=(12, 6))

ax.plot(years, df_as_is["Итого"], 'r-o', linewidth=2, markersize=8, label='AS-IS (текущее DWH+ESB)')
ax.plot(years, df_to_be["Итого"], 'g-s', linewidth=2, markersize=8, label='TO-BE (Data Mesh с DataHub)')
ax.set_xlabel('Год', fontsize=12)
ax.set_ylabel('Тыс. USD', fontsize=12)
ax.set_title('Совокупная стоимость владения (TCO)', fontsize=14, fontweight='bold')
ax.legend()
ax.grid(True, linestyle='--', alpha=0.7)
ax.set_xticks(years)

for x, y in zip(years, df_as_is["Итого"]):
    ax.text(x, y+20, f'{y}', ha='center', va='bottom', color='red', fontweight='bold')
for x, y in zip(years, df_to_be["Итого"]):
    ax.text(x, y-30, f'{y}', ha='center', va='top', color='green', fontweight='bold')

table_data = []
for y, as_val, to_val, sav, cum in zip(years, df_as_is["Итого"], df_to_be["Итого"], savings, cumulative_savings):
    table_data.append([f"Год {y}", f"${as_val}K", f"${to_val}K", f"${sav}K", f"${cum}K"])

columns = ["Период", "AS-IS (тыс.$)", "TO-BE (тыс.$)", "Экономия (тыс.$)", "Накопл. экономия (тыс.$)"]
table_data.insert(0, columns)

plt.subplots_adjust(bottom=0.35)

# Размещение таблицы
table = plt.table(cellText=table_data, cellLoc='center', loc='bottom',
                  bbox=[0.15, -0.45, 0.7, 0.35])
table.auto_set_font_size(False)
table.set_fontsize(10)
table.scale(1, 1.5)

for (row, col), cell in table.get_celld().items():
    if row == 0:
        cell.set_facecolor('#40466e')
        cell.set_text_props(color='white', fontweight='bold')
    elif row % 2 == 0:
        cell.set_facecolor('#f0f0f0')

ax.set_xlim(years[0], years[-1])

plt.show()