import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: "Carrito de Compras"

    ListModel {
            id: productosDisponibles
            ListElement { nombre: "Laptop"; precio: 1200 }
            ListElement { nombre: "Mouse"; precio: 25 }
            ListElement { nombre: "Teclado"; precio: 45 }
            ListElement { nombre: "Monitor"; precio: 300 }
        }
}
