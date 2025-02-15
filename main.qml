import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 650
    height: 450
    title: "🛒"

    ListModel {
        id: productosDisponibles
        ListElement { nombre: "Laptop"; precio: 1200 }
        ListElement { nombre: "Mouse"; precio: 25 }
        ListElement { nombre: "Teclado"; precio: 45 }
        ListElement { nombre: "Monitor"; precio: 300 }
    }

    ListModel {
        id: carritoCompras
    }

    // Property para almacenar el total del carrito
    property real totalCarrito: 0

    // Conexión para actualizar el total cada vez que cambie el carrito
    Connections {
        target: carritoCompras
        onCountChanged: actualizarTotal()
    }

    function actualizarTotal() {
        var total = 0;
        for (var i = 0; i < carritoCompras.count; i++) {
            total += carritoCompras.get(i).precio;
        }
        totalCarrito = total;
    }

    Rectangle {
        anchors.fill: parent
        color: "#F5F5F5"
    }

    Column {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: "Carrito de Compras"
            font.bold: true
            font.pointSize: 16
            color: "#333"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            spacing: 20

            // Productos disponibles
            Item {
                width: 310
                height: 310

                Rectangle {
                    width: 310
                    height: 310
                    radius: 15
                    color: "#AAA"
                    opacity: 0.2
                    anchors.centerIn: parent
                }

                Rectangle {
                    width: 300
                    height: 300
                    radius: 15
                    color: "white"
                    border.color: "#DDD"
                    border.width: 2
                    anchors.centerIn: parent

                    Column {
                        spacing: 10
                        anchors.fill: parent
                        anchors.margins: 10

                        Text {
                            text: "Productos In-stock"
                            font.bold: true
                            font.pointSize: 14
                            color: "#444"
                        }

                        ListView {
                            id: listaProductos
                            width: parent.width
                            height: 250
                            model: productosDisponibles
                            delegate: Rectangle {
                                width: parent.width - 20
                                height: 50
                                radius: 10
                                color: "#E3F2FD"
                                border.color: "#90CAF9"
                                anchors.horizontalCenter: parent.horizontalCenter

                                Row {
                                    spacing: 10
                                    anchors.centerIn: parent

                                    Text { text: nombre; font.bold: true }
                                    Text { text: "$" + precio }

                                    Button {
                                        text: "+"
                                        background: Rectangle {
                                            color: "#4CAF50"
                                            radius: 10
                                        }
                                        onClicked: carritoCompras.append({ nombre: nombre, precio: precio })
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Contenedor del carrito
            Item {
                width: 310
                height: 310

                Rectangle {
                    width: 310
                    height: 310
                    radius: 15
                    color: "#AAA"
                    opacity: 0.2
                    anchors.centerIn: parent
                }

                Rectangle {
                    width: 300
                    height: 300
                    radius: 15
                    color: "white"
                    border.color: "#DDD"
                    border.width: 2
                    anchors.centerIn: parent

                    Column {
                        spacing: 10
                        anchors.fill: parent
                        anchors.margins: 10

                        Text {
                            text: "Carrito"
                            font.bold: true
                            font.pointSize: 14
                            color: "#444"
                        }

                        ListView {
                            id: listaCarrito
                            width: parent.width
                            height: 250
                            model: carritoCompras
                            delegate: Rectangle {
                                width: parent.width - 20
                                height: 50
                                radius: 10
                                color: "#FFEBEE"
                                border.color: "#EF9A9A"
                                anchors.horizontalCenter: parent.horizontalCenter

                                Row {
                                    spacing: 10
                                    anchors.centerIn: parent

                                    Text { text: nombre; font.bold: true }
                                    Text { text: "$" + precio }

                                    Button {
                                        text: "-"
                                        background: Rectangle {
                                            color: "#F44336"
                                            radius: 10
                                        }
                                        onClicked: carritoCompras.remove(index)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // Total del carrito
        Rectangle {
            width: 250
            height: 50
            radius: 15
            color: "#FFF9C4"
            border.color: "#FFEB3B"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: totalTexto
                text: "Total: $" + totalCarrito
                font.bold: true
                font.pointSize: 14
                anchors.centerIn: parent
                color: "#000" // Asegura que el texto sea visible
            }
        }
    }

    Component.onCompleted: {
        actualizarTotal();
    }
}
