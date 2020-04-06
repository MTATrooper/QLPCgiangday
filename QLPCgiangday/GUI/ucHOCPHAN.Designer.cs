namespace QLPCgiangday.GUI
{
    partial class ucHOCPHAN
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnHuy = new DevExpress.XtraEditors.SimpleButton();
            this.btnLuu = new DevExpress.XtraEditors.SimpleButton();
            this.btnXoa = new DevExpress.XtraEditors.SimpleButton();
            this.btnSua = new DevExpress.XtraEditors.SimpleButton();
            this.labelControl4 = new DevExpress.XtraEditors.LabelControl();
            this.labelControl3 = new DevExpress.XtraEditors.LabelControl();
            this.txtSOTiet = new DevExpress.XtraEditors.TextEdit();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.txtTEN = new DevExpress.XtraEditors.TextEdit();
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.btnThem = new DevExpress.XtraEditors.SimpleButton();
            this.txtMA = new DevExpress.XtraEditors.TextEdit();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.labelControl6 = new DevExpress.XtraEditors.LabelControl();
            this.txtSOTC = new DevExpress.XtraEditors.TextEdit();
            this.cbBMH = new System.Windows.Forms.ComboBox();
            this.gridHP = new DevExpress.XtraGrid.GridControl();
            this.dataHP = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.STT = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MAHP = new DevExpress.XtraGrid.Columns.GridColumn();
            this.TENHP = new DevExpress.XtraGrid.Columns.GridColumn();
            this.SOTC = new DevExpress.XtraGrid.Columns.GridColumn();
            this.SOTIET = new DevExpress.XtraGrid.Columns.GridColumn();
            this.MAMH = new DevExpress.XtraGrid.Columns.GridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.txtSOTiet.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtTEN.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMA.Properties)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtSOTC.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridHP)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataHP)).BeginInit();
            this.SuspendLayout();
            // 
            // btnHuy
            // 
            this.btnHuy.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnHuy.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuy.Image = global::QLPCgiangday.Properties.Resources.remove;
            this.btnHuy.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnHuy.Location = new System.Drawing.Point(218, 349);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(75, 51);
            this.btnHuy.TabIndex = 25;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // btnLuu
            // 
            this.btnLuu.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnLuu.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuu.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuu.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuu.Location = new System.Drawing.Point(103, 349);
            this.btnLuu.Name = "btnLuu";
            this.btnLuu.Size = new System.Drawing.Size(75, 51);
            this.btnLuu.TabIndex = 24;
            this.btnLuu.Text = "Lưu";
            this.btnLuu.Click += new System.EventHandler(this.btnLuu_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnXoa.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoa.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoa.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoa.Location = new System.Drawing.Point(281, 277);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(75, 51);
            this.btnXoa.TabIndex = 23;
            this.btnXoa.Text = "Xóa";
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnSua
            // 
            this.btnSua.BackgroundImage = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSua.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnSua.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSua.Image = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSua.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnSua.Location = new System.Drawing.Point(150, 277);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(75, 51);
            this.btnSua.TabIndex = 22;
            this.btnSua.Text = "Sửa";
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // labelControl4
            // 
            this.labelControl4.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl4.Location = new System.Drawing.Point(49, 233);
            this.labelControl4.Name = "labelControl4";
            this.labelControl4.Size = new System.Drawing.Size(64, 19);
            this.labelControl4.TabIndex = 21;
            this.labelControl4.Text = "Môn học:";
            // 
            // labelControl3
            // 
            this.labelControl3.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl3.Location = new System.Drawing.Point(49, 183);
            this.labelControl3.Name = "labelControl3";
            this.labelControl3.Size = new System.Drawing.Size(48, 19);
            this.labelControl3.TabIndex = 19;
            this.labelControl3.Text = "Số tiết:";
            // 
            // txtSOTiet
            // 
            this.txtSOTiet.Location = new System.Drawing.Point(159, 180);
            this.txtSOTiet.Name = "txtSOTiet";
            this.txtSOTiet.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSOTiet.Properties.Appearance.Options.UseFont = true;
            this.txtSOTiet.Size = new System.Drawing.Size(186, 26);
            this.txtSOTiet.TabIndex = 18;
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Location = new System.Drawing.Point(49, 86);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(94, 19);
            this.labelControl2.TabIndex = 17;
            this.labelControl2.Text = "Tên học phần:";
            // 
            // txtTEN
            // 
            this.txtTEN.Location = new System.Drawing.Point(159, 83);
            this.txtTEN.Name = "txtTEN";
            this.txtTEN.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTEN.Properties.Appearance.Options.UseFont = true;
            this.txtTEN.Size = new System.Drawing.Size(186, 26);
            this.txtTEN.TabIndex = 16;
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Location = new System.Drawing.Point(49, 40);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(92, 19);
            this.labelControl1.TabIndex = 15;
            this.labelControl1.Text = "Mã học phần:";
            // 
            // btnThem
            // 
            this.btnThem.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThem.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThem.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnThem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThem.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThem.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThem.Location = new System.Drawing.Point(33, 277);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(75, 51);
            this.btnThem.TabIndex = 14;
            this.btnThem.Text = "Thêm";
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // txtMA
            // 
            this.txtMA.Location = new System.Drawing.Point(159, 37);
            this.txtMA.Name = "txtMA";
            this.txtMA.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMA.Properties.Appearance.Options.UseFont = true;
            this.txtMA.Size = new System.Drawing.Size(186, 26);
            this.txtMA.TabIndex = 13;
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.cbBMH);
            this.groupBox1.Controls.Add(this.labelControl6);
            this.groupBox1.Controls.Add(this.txtSOTC);
            this.groupBox1.Controls.Add(this.btnHuy);
            this.groupBox1.Controls.Add(this.btnLuu);
            this.groupBox1.Controls.Add(this.btnXoa);
            this.groupBox1.Controls.Add(this.btnSua);
            this.groupBox1.Controls.Add(this.labelControl4);
            this.groupBox1.Controls.Add(this.labelControl3);
            this.groupBox1.Controls.Add(this.txtSOTiet);
            this.groupBox1.Controls.Add(this.labelControl2);
            this.groupBox1.Controls.Add(this.txtTEN);
            this.groupBox1.Controls.Add(this.labelControl1);
            this.groupBox1.Controls.Add(this.btnThem);
            this.groupBox1.Controls.Add(this.txtMA);
            this.groupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(36, 66);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(391, 424);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Học phần";
            // 
            // labelControl6
            // 
            this.labelControl6.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl6.Location = new System.Drawing.Point(49, 133);
            this.labelControl6.Name = "labelControl6";
            this.labelControl6.Size = new System.Drawing.Size(66, 19);
            this.labelControl6.TabIndex = 27;
            this.labelControl6.Text = "Số tín chỉ:";
            // 
            // txtSOTC
            // 
            this.txtSOTC.Location = new System.Drawing.Point(159, 130);
            this.txtSOTC.Name = "txtSOTC";
            this.txtSOTC.Properties.Appearance.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSOTC.Properties.Appearance.Options.UseFont = true;
            this.txtSOTC.Size = new System.Drawing.Size(186, 26);
            this.txtSOTC.TabIndex = 26;
            // 
            // cbBMH
            // 
            this.cbBMH.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbBMH.FormattingEnabled = true;
            this.cbBMH.Location = new System.Drawing.Point(159, 229);
            this.cbBMH.Name = "cbBMH";
            this.cbBMH.Size = new System.Drawing.Size(149, 23);
            this.cbBMH.TabIndex = 28;
            // 
            // gridHP
            // 
            this.gridHP.Location = new System.Drawing.Point(488, 82);
            this.gridHP.MainView = this.dataHP;
            this.gridHP.Name = "gridHP";
            this.gridHP.Size = new System.Drawing.Size(648, 408);
            this.gridHP.TabIndex = 5;
            this.gridHP.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.dataHP});
            // 
            // dataHP
            // 
            this.dataHP.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.STT,
            this.MAHP,
            this.TENHP,
            this.SOTC,
            this.SOTIET,
            this.MAMH});
            this.dataHP.GridControl = this.gridHP;
            this.dataHP.Name = "dataHP";
            this.dataHP.OptionsDetail.DetailMode = DevExpress.XtraGrid.Views.Grid.DetailMode.Default;
            this.dataHP.OptionsFind.AlwaysVisible = true;
            this.dataHP.OptionsView.ShowGroupPanel = false;
            this.dataHP.CustomDrawCell += new DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventHandler(this.dataHP_CustomDrawCell);
            this.dataHP.FocusedRowChanged += new DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventHandler(this.dataHP_FocusedRowChanged);
            this.dataHP.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataHP_KeyDown);
            this.dataHP.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataHP_KeyDown);
            // 
            // STT
            // 
            this.STT.Caption = "STT";
            this.STT.Name = "STT";
            this.STT.Visible = true;
            this.STT.VisibleIndex = 0;
            this.STT.Width = 50;
            // 
            // MAHP
            // 
            this.MAHP.Caption = "Mã học phần";
            this.MAHP.FieldName = "MAHP";
            this.MAHP.Name = "MAHP";
            this.MAHP.Visible = true;
            this.MAHP.VisibleIndex = 1;
            this.MAHP.Width = 70;
            // 
            // TENHP
            // 
            this.TENHP.Caption = "Tên học phần";
            this.TENHP.FieldName = "TENHP";
            this.TENHP.Name = "TENHP";
            this.TENHP.Visible = true;
            this.TENHP.VisibleIndex = 2;
            this.TENHP.Width = 200;
            // 
            // SOTC
            // 
            this.SOTC.Caption = "Số tín chỉ";
            this.SOTC.FieldName = "SOTC";
            this.SOTC.Name = "SOTC";
            this.SOTC.Visible = true;
            this.SOTC.VisibleIndex = 3;
            this.SOTC.Width = 50;
            // 
            // SOTIET
            // 
            this.SOTIET.Caption = "Số tiết";
            this.SOTIET.FieldName = "SOTIET";
            this.SOTIET.Name = "SOTIET";
            this.SOTIET.Visible = true;
            this.SOTIET.VisibleIndex = 4;
            this.SOTIET.Width = 50;
            // 
            // MAMH
            // 
            this.MAMH.Caption = "Môn học";
            this.MAMH.FieldName = "MAMH";
            this.MAMH.Name = "MAMH";
            this.MAMH.Visible = true;
            this.MAMH.VisibleIndex = 5;
            this.MAMH.Width = 210;
            // 
            // ucHOCPHAN
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.gridHP);
            this.Controls.Add(this.groupBox1);
            this.Name = "ucHOCPHAN";
            this.Size = new System.Drawing.Size(1166, 527);
            this.Load += new System.EventHandler(this.ucHOCPHAN_Load);
            ((System.ComponentModel.ISupportInitialize)(this.txtSOTiet.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtTEN.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtMA.Properties)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtSOTC.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridHP)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataHP)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.SimpleButton btnHuy;
        private DevExpress.XtraEditors.SimpleButton btnLuu;
        private DevExpress.XtraEditors.SimpleButton btnXoa;
        private DevExpress.XtraEditors.SimpleButton btnSua;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.TextEdit txtSOTiet;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.TextEdit txtTEN;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton btnThem;
        private DevExpress.XtraEditors.TextEdit txtMA;
        private System.Windows.Forms.GroupBox groupBox1;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.TextEdit txtSOTC;
        private System.Windows.Forms.ComboBox cbBMH;
        private DevExpress.XtraGrid.GridControl gridHP;
        private DevExpress.XtraGrid.Views.Grid.GridView dataHP;
        private DevExpress.XtraGrid.Columns.GridColumn STT;
        private DevExpress.XtraGrid.Columns.GridColumn MAHP;
        private DevExpress.XtraGrid.Columns.GridColumn TENHP;
        private DevExpress.XtraGrid.Columns.GridColumn SOTC;
        private DevExpress.XtraGrid.Columns.GridColumn SOTIET;
        private DevExpress.XtraGrid.Columns.GridColumn MAMH;
    }
}
