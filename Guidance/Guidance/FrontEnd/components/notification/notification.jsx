import React from 'react';

import NotificationSystem from 'react-notification-system';

class Notification extends React.Component {
  constructor(props) {
    super(props);

    this._notificationSystem = null;
  }

  componentDidMount() {
    this._notificationSystem = this.refs.notificationSystem;
  }

  checkErrors() {
    if (this._notificationSystem && this.props.errors.length > 0) {
      this.props.errors.forEach(error =>
        this._notificationSystem.addNotification({
          message: error,
          level: 'error'
        })
      );
    }
  }

  render() {
    return (
      <div>
        {this.checkErrors()}
        <NotificationSystem ref="notificationSystem" />
      </div>
    );
  }
}

export default Notification;
