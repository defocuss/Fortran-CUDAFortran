from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt

base_dir = Path(__file__).resolve().parent
datos = np.loadtxt(base_dir / "p_calor.txt")

plt.figure(figsize=(8, 6))
plt.imshow(datos, cmap="inferno", origin="lower", aspect="equal")
plt.colorbar(label="Temperatura")
plt.title("Mapa de calor")
plt.xlabel("Columna")
plt.ylabel("Fila")
plt.savefig(base_dir / "mapa_calor.png", dpi=300, bbox_inches="tight")