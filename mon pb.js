
import React from 'react';
import ReactDOM from 'react-dom';
function MyThing() {
	return (
			React.createElement(
				'div',{className: 'book'},
											('div',{className: 'title'},'title'),
											('div',{className: 'author'},'The author'),
											('ul', {className: 'stats'},
												('li', {className: 'isbn'},'12-345678-910'),
												('li', {className: 'rating'},'5 stars')
											)
			)

	);
}
ReactDOM.render(
<MyThing/>,
document.querySelector('#root')
);

