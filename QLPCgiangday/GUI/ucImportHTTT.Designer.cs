namespace QLPCgiangday.GUI
{
    partial class ucImportHTTT
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
            this.dataPC_HTTT = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_HTTT)).BeginInit();
            this.SuspendLayout();
            // 
            // dataPC_HTTT
            // 
            this.dataPC_HTTT.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataPC_HTTT.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataPC_HTTT.Location = new System.Drawing.Point(0, 0);
            this.dataPC_HTTT.Name = "dataPC_HTTT";
            this.dataPC_HTTT.Size = new System.Drawing.Size(885, 438);
            this.dataPC_HTTT.TabIndex = 2;
            // 
            // ucImportHTTT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataPC_HTTT);
            this.Name = "ucImportHTTT";
            this.Size = new System.Drawing.Size(885, 438);
            this.Load += new System.EventHandler(this.ucImportHTTT_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_HTTT)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataPC_HTTT;
    }
}
