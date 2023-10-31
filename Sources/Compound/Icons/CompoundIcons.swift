//
// Copyright 2023 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import CompoundDesignTokens
import SwiftUI

public extension Image {
    /// The icons used by Element as defined in Compound Design Tokens.
    static let compound = CompoundIcons()
}

/// A manually generated collection of all the icons in Compound. This allows the
/// `CompoundIcon` component to be created using a `KeyPath` until we can
/// drop the static keyword in the generated tokens.
public struct CompoundIcons {
    /// The raw compound tokens.
    private static let compound = CompoundIconTokens.self
    
    public let webBrowser = compound.iconWebBrowser
    public let voiceCall = compound.iconVoiceCall
    public let visibilityOn = compound.iconVisibilityOn
    public let visibilityOff = compound.iconVisibilityOff
    public let videoCallSolid = compound.iconVideoCallSolid
    public let videoCallOffSolid = compound.iconVideoCallOffSolid
    public let videoCallMissedSolid = compound.iconVideoCallMissedSolid
    public let videoCallDeclinedSolid = compound.iconVideoCallDeclinedSolid
    public let verified = compound.iconVerified
    public let userProfile = compound.iconUserProfile
    public let userAdd = compound.iconUserAdd
    public let userAddSolid = compound.iconUserAddSolid
    public let threads = compound.iconThreads
    public let threadsSolid = compound.iconThreadsSolid
    public let share = compound.iconShare
    public let shareAndroid = compound.iconShareAndroid
    public let settings = compound.iconSettings
    public let settingsSolid = compound.iconSettingsSolid
    public let search = compound.iconSearch
    public let `public` = compound.iconPublic
    public let popOut = compound.iconPopOut
    public let polls = compound.iconPolls
    public let overflowVertical = compound.iconOverflowVertical
    public let overflowHorizontal = compound.iconOverflowHorizontal
    public let offline = compound.iconOffline
    public let notifications = compound.iconNotifications
    public let notificationsSolid = compound.iconNotificationsSolid
    public let notificationsSolidOff = compound.iconNotificationsSolidOff
    public let notificationsOff = compound.iconNotificationsOff
    public let mobile = compound.iconMobile
    public let micOnSolid = compound.iconMicOnSolid
    public let micOnOutline = compound.iconMicOnOutline
    public let mention = compound.iconMention
    public let markerReadReceipts = compound.iconMarkerReadReceipts
    public let lock = compound.iconLock
    public let lockOff = compound.iconLockOff
    public let link = compound.iconLink
    public let leave = compound.iconLeave
    public let infoSolid = compound.iconInfoSolid
    public let filter = compound.iconFilter
    public let files = compound.iconFiles
    public let favouriteOn = compound.iconFavouriteOn
    public let favouriteOff = compound.iconFavouriteOff
    public let extensions = compound.iconExtensions
    public let exportArchive = compound.iconExportArchive
    public let error = compound.iconError
    public let dragList = compound.iconDragList
    public let dragGrid = compound.iconDragGrid
    public let download = compound.iconDownload
    public let delete = compound.iconDelete
    public let computer = compound.iconComputer
    public let close = compound.iconClose
    public let chevronUpDown = compound.iconChevronUpDown
    public let chevronRight = compound.iconChevronRight
    public let chevronLeft = compound.iconChevronLeft
    public let chevronDown = compound.iconChevronDown
    public let check = compound.iconCheck
    public let checkCircleSolid = compound.iconCheckCircleSolid
    public let chat = compound.iconChat
    public let chatProblem = compound.iconChatProblem
    public let chatNew = compound.iconChatNew
    public let block = compound.iconBlock
    public let arrowUpRight = compound.iconArrowUpRight
    public let arrowRight = compound.iconArrowRight
    public let arrowLeft = compound.iconArrowLeft
}
