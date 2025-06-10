/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const clienteSelect = document.getElementById("clienteSelect");
const empleadoSelect = document.getElementById("empleadoSelect");
const productosTable = document.getElementById("productosTable");
const carritoLista = document.getElementById("carrito");
const totalEl = document.getElementById("total");

let carrito = [];

async function cargarClientes() {
    const res = await fetch("http://localhost:8081/api/v1/client");
    const data = await res.json();
    data.clients.forEach(c => {
        const option = document.createElement("option");
        option.value = c.nombre + " " + c.apellido;
        option.textContent = `${c.nombre} ${c.apellido}`;
        clienteSelect.appendChild(option);
    });
}

async function cargarEmpleados() {
    const res = await fetch("http://localhost:8081/api/v1/employee");
    const data = await res.json();
    data.employees.forEach(e => {
        const option = document.createElement("option");
        option.value = e.nombre + " " + e.apellido;
        option.textContent = `${e.nombre} ${e.apellido}`;
        empleadoSelect.appendChild(option);
    });
}

async function cargarProductos() {
    const res = await fetch("http://localhost:8081/api/v1/products");
    const data = await res.json();
    data.products.forEach(p => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
      <td>${p.name}</td>
      <td>$${p.price.toFixed(2)}</td>
      <td>${p.stock}</td>
      <td><input type="number" min="1" max="${p.stock}" value="1" id="cantidad-${p.id}" class="form-control form-control-sm" style="width: 80px;"></td>
      <td><button class="btn btn-sm btn-primary" onclick="agregarAlCarrito(${p.id}, '${p.name}', ${p.price})">Agregar</button></td>
    `;
        productosTable.appendChild(tr);
    });
}

function agregarAlCarrito(id, nombre, precio) {
    const cantidad = parseInt(document.getElementById(`cantidad-${id}`).value);
    if (cantidad <= 0)
        return;

    const productoExistente = carrito.find(p => p.id === id);
    if (productoExistente) {
        productoExistente.cantidad += cantidad;
    } else {
        carrito.push({id, nombre, cantidad, precio});
    }

    actualizarCarrito();
}

function actualizarCarrito() {
  carritoLista.innerHTML = "";
  let total = 0;

  carrito.forEach((p, index) => {
    const li = document.createElement("li");
    li.className = "list-group-item d-flex justify-content-between align-items-center";

    const precioTotal = (p.precio * p.cantidad).toFixed(2);

    li.innerHTML = `
      <div>
        ${p.nombre} x${p.cantidad} - $${precioTotal}
      </div>
      <button class="btn btn-sm btn-danger" onclick="eliminarDelCarrito(${index})">❌</button>
    `;

    carritoLista.appendChild(li);
    total += p.precio * p.cantidad;
  });

  totalEl.textContent = total.toFixed(2);
}


async function enviarVenta() {
    if (!clienteSelect.value || !empleadoSelect.value || carrito.length === 0) {
        alert("Debes seleccionar cliente, empleado y al menos un producto.");
        return;
    }

    const jsonVenta = {
        fecha: new Date().toISOString().split("T")[0],
        cliente: clienteSelect.value,
        empleado: empleadoSelect.value,
        productos: carrito,
        total: parseFloat(totalEl.textContent)
    };

    const res = await fetch("http://localhost:8081/api/v1/sales", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({jsonSales: JSON.stringify(jsonVenta)})
    });

    const resultado = await res.json();
    alert(resultado.message || "Venta enviada correctamente");

    // Reset
    carrito = [];
    actualizarCarrito();
}

function eliminarDelCarrito(index) {
  carrito.splice(index, 1);
  actualizarCarrito();
}


cargarClientes();
cargarEmpleados();
cargarProductos();
